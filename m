Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AEE4E9DCF
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 19:48:08 +0200 (CEST)
Received: from localhost ([::1]:34080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYtTK-0000VQ-Tl
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 13:48:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adeason@sinenomine.net>)
 id 1nYtQH-00081T-RN
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 13:44:57 -0400
Received: from smtp67.iad3a.emailsrvr.com ([173.203.187.67]:38577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adeason@sinenomine.net>)
 id 1nYtQG-00060W-4Q
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 13:44:57 -0400
X-Auth-ID: adeason@sinenomine.net
Received: by smtp25.relay.iad3a.emailsrvr.com (Authenticated sender:
 adeason-AT-sinenomine.net) with ESMTPSA id 4932823924; 
 Mon, 28 Mar 2022 13:44:31 -0400 (EDT)
Date: Mon, 28 Mar 2022 12:44:30 -0500
From: Andrew Deason <adeason@sinenomine.net>
To: Michal =?UTF-8?B?UHLDrXZvem7DrWs=?= <mprivozn@redhat.com>
Subject: Re: [PATCH 3/3] qga/commands-posix: Fix listing ifaces for Solaris
Message-Id: <20220328124430.e752e82107ded8a0abbe48c0@sinenomine.net>
In-Reply-To: <10f8e706-ae5b-6cd1-d057-110933b865ff@redhat.com>
References: <20220320213843.4544-1-adeason@sinenomine.net>
 <20220320213843.4544-4-adeason@sinenomine.net>
 <10f8e706-ae5b-6cd1-d057-110933b865ff@redhat.com>
Organization: Sine Nomine Associates
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Classification-ID: a927c675-dfc9-4c9d-ab61-ca1dcc565442-1-1
Received-SPF: pass client-ip=173.203.187.67;
 envelope-from=adeason@sinenomine.net; helo=smtp67.iad3a.emailsrvr.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 21 Mar 2022 10:14:57 +0100
Michal Prívozník <mprivozn@redhat.com> wrote:

> On 3/20/22 22:38, Andrew Deason wrote:
> > The code for guest-network-get-interfaces needs a couple of small
> > adjustments for Solaris:
> > 
> > - The results from SIOCGIFHWADDR are documented as being in ifr_addr,
> >   not ifr_hwaddr (ifr_hwaddr doesn't exist on Solaris).
> > 
> > - The implementation of guest_get_network_stats is Linux-specific, so
> >   hide it under #ifdef CONFIG_LINUX. On non-Linux, we just won't
> >   provide network interface stats.
> > 
> > Signed-off-by: Andrew Deason <adeason@sinenomine.net>
> > ---
> >  qga/commands-posix.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> > 
> > diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> > index bd0d67f674..c0b00fc488 100644
> > --- a/qga/commands-posix.c
> > +++ b/qga/commands-posix.c
> > @@ -2781,20 +2781,21 @@ guest_find_interface(GuestNetworkInterfaceList *head,
> >              return head->value;
> >          }
> >      }
> >  
> >      return NULL;
> >  }
> >  
> >  static int guest_get_network_stats(const char *name,
> >                         GuestNetworkInterfaceStat *stats)
> >  {
> > +#ifdef CONFIG_LINUX
> >      int name_len;
> >      char const *devinfo = "/proc/net/dev";
> >      FILE *fp;
> >      char *line = NULL, *colon;
> >      size_t n = 0;
> >      fp = fopen(devinfo, "r");
> >      if (!fp) {
> >          return -1;
> >      }
> >      name_len = strlen(name);
> > @@ -2836,20 +2837,21 @@ static int guest_get_network_stats(const char *name,
> >              stats->tx_errs = tx_errs;
> >              stats->tx_dropped = tx_dropped;
> >              fclose(fp);
> >              g_free(line);
> >              return 0;
> >          }
> >      }
> >      fclose(fp);
> >      g_free(line);
> >      g_debug("/proc/net/dev: Interface '%s' not found", name);
> > +#endif /* CONFIG_LINUX */
> 
> I wonder whether we should signal this somehow. I mean, have something
> like this:
> 
> #else /* !CONFIG_LINUX */
>   g_debug("Stats reporting available only for Linux");
> #endif /* !CONFIG_LINUX */
> 
> >      return -1;
> >  }
> 
> A counter argument is that if fopen() above fails then -1 is returned
> without any error/debug message reported. And stats fetching is best
> effort anyway.

Ping for this stack. Should I just go ahead and add the above? Sorry if
I was expected to respond to this; I don't disagree but I also saw the
existing silent-failure code path so it doesn't seem like it matters.

I could add debug messages for both silent-failure code paths, maybe as
a separate commit afterwards?

-- 
Andrew Deason
adeason@sinenomine.net

