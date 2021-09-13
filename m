Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB004091A6
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 16:02:33 +0200 (CEST)
Received: from localhost ([::1]:36292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPmXY-0001Wc-TV
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 10:02:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mPli8-0001zw-PS
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 09:09:26 -0400
Received: from mga09.intel.com ([134.134.136.24]:16672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mPli6-00048q-6x
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 09:09:24 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10105"; a="221708805"
X-IronPort-AV: E=Sophos;i="5.85,288,1624345200"; d="scan'208";a="221708805"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 06:06:27 -0700
X-IronPort-AV: E=Sophos;i="5.85,288,1624345200"; d="scan'208";a="543205240"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.144.101])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 13 Sep 2021 06:06:24 -0700
Date: Mon, 13 Sep 2021 20:52:28 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 pbonzini@redhat.com
Subject: Re: [PATCH v2 1/3] monitor: Add HMP and QMP interfaces
Message-ID: <20210913125228.GA27608@yangzhon-Virtual>
References: <20210910102258.46648-1-yang.zhong@intel.com>
 <20210910102258.46648-2-yang.zhong@intel.com>
 <YTthmPn2KGcfNX21@redhat.com> <YT8bboSgYfWJP9kh@redhat.com>
 <4ae8c563-9b44-d234-eb01-a61000d01439@redhat.com>
 <YT9KbTrZv7XpvNbN@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YT9KbTrZv7XpvNbN@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=134.134.136.24; envelope-from=yang.zhong@intel.com;
 helo=mga09.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: yang.zhong@intel.com, seanjc@google.com, eblake@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 13, 2021 at 01:56:13PM +0100, Daniel P. Berrangé wrote:
> On Mon, Sep 13, 2021 at 02:48:37PM +0200, Paolo Bonzini wrote:
> > On 13/09/21 11:35, Daniel P. Berrangé wrote:
> > > >    g_autoptr(Error) err = NULL
> > > I was mistaken here - Error shouldn't use g_autoptr, just
> > > 
> > >     Error err = NULL;
> > > 
> > > > > +    SGXInfo *info = qmp_query_sgx(NULL);
> > > > Pass in &err not NULL;
> > > > 
> > > > Also  declare it with  'g_autoptr(SGXInfo) info = ...'
> > > > 
> > > > And then
> > > > 
> > > >     if (err) {
> > > >        monitor_printf(mon, "%s\n", error_get_pretty(err);
> > > Then use the simpler:
> > > 
> > >      error_report_err(err);
> > 
> > Indeed.
> > 
> > That said, more long term (but this is something Coccinelle could help with)
> > perhaps error_report_err should not free the error, and instead we should
> > use g_autoptr(Error) in the callers.  I don't like functions that do not
> > have free in their name and yet free a pointer...
> 
> Yes, this error_report_err surprises me every 6 months when I
> come to deal with it. So I think using g_autoptr would be a
> nice replacement, with no additional burden in terms of lines
> of code in callers too.
>

  Do we need call qapi_free_SGXInfo(info) here?

  In previous code design, the code like below:

  SGXInfo *info = qmp_query_sgx(&err);
  ......
  qapi_free_SGXInfo(info);


  Yang

 
> Regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

