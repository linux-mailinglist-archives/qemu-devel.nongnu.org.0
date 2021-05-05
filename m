Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B9A37392E
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 13:19:49 +0200 (CEST)
Received: from localhost ([::1]:36824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leFZE-0002eN-LJ
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 07:19:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1leFYT-00029d-Eu; Wed, 05 May 2021 07:19:01 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:59059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1leFYR-0006LF-Rg; Wed, 05 May 2021 07:19:01 -0400
Received: from [192.168.100.1] ([82.142.20.222]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MHWzP-1lis7g2c2j-00DUx2; Wed, 05 May 2021 13:18:45 +0200
Subject: Re: [PATCH 6/7] linux-user: use GDateTime for formatting timestamp
 for core file
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210505103702.521457-1-berrange@redhat.com>
 <20210505103702.521457-7-berrange@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <49d2bc96-a365-b79b-755f-ee8b2ad5c97c@vivier.eu>
Date: Wed, 5 May 2021 13:18:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210505103702.521457-7-berrange@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:QraB3wO19PGCjWQZtCSP2Lta0bllUTblivaYFYb24MNW12yrjhN
 24OoexHzmi6hquggp1tpms4MLKRM5bEd83dpBcPMLPCYI1+Gi4dS7lRPR+SB+Ly6yjGYb1P
 6tgXQQ9M+vLe/K2fLP52NCv0WwSHkdrEloZmUogQY0RHKLsyNOaJYh1D3iWcU2evrEsr3NZ
 wM9lZtrM2SL8/btDC+VMA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:bEBN/KYt1Z8=:6SrIy8BlUNrpbUwiLcAlA3
 cs58z5i5BXLXjc05uPYchGXQlwpbto46oJ6rIfEXkTt7+Inl1o0HPO3i9uLgolj1DP9NTGZ+h
 i5garby4vS5xRErlm9/zzfTfjDjPSWFHt6bY+OFBaXsa9JThKVYmhjkBSCBQKGgtudtT1QgMo
 MuiezdCxAQg4Q8pV5A7LyeX5z1RmkExmpk6Lmaa5zv/9IhmVhl3z1wUWDUFeLtEgMQlOr/zsY
 83icvxi1dAt40F9xNasHcCOBe4HtzJtmT7j7U19jiW3wRjotg3Wr3+nTWKo20pA5YSNDXkHgC
 OmD+vZi44T/sEfHdynZr+vAwS1MLVf5A5RcxHC3trJ+s7tJYlaeN3ajVH1qha6+fYKjoTd4Pp
 7J5AQYt33I74mpgPCsbd2vsGSL1j2ptx+ggOXxu14Fra/61Dii7UOQy1Bvw2vOalomDzptLzS
 jSvaMkmJizCKpbiLFFON+sW7m+MNSXbXMew3MfjqVS+nMaGWIpchZWezovBePlYMT47Gbr/Iz
 WhnuIZFaYSjA9zEZWFlcnQ=
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Jiri Pirko <jiri@resnulli.us>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, virtio-fs@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 05/05/2021 à 12:37, Daniel P. Berrangé a écrit :
> The GDateTime APIs provided by GLib avoid portability pitfalls, such
> as some platforms where 'struct timeval.tv_sec' field is still 'long'
> instead of 'time_t'. When combined with automatic cleanup, GDateTime
> often results in simpler code too.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  linux-user/elfload.c | 36 +++++++++---------------------------
>  1 file changed, 9 insertions(+), 27 deletions(-)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


