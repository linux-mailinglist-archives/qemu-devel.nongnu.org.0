Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2B528CE52
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Oct 2020 14:28:36 +0200 (CEST)
Received: from localhost ([::1]:55324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kSJPw-0008H9-07
	for lists+qemu-devel@lfdr.de; Tue, 13 Oct 2020 08:28:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kSJOc-0007KP-Si; Tue, 13 Oct 2020 08:27:14 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:37364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kSJOa-0001eK-0n; Tue, 13 Oct 2020 08:27:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=ReNoDpOZ02GAdTOeq5XDIA3TkA302AFlilXA4E3iNKM=; 
 b=sSwZ23cLffpGRkcNKc6PhF5qOH7a+QtOCUkD1pAbWREAuvq0Sk9KGgbxn2OZCMv95yuglp0t0zg5JtFMPwLw7HUVr5HulVlxGUJ7/uA2vgYu72Ki1a5Vhhj827nu0qne8YB6AD10aPXisW0OBv7ls7QEikIxS9xwcSR90L2DMsV3cuhSRGDVtUHaCETH4pggjdp6JTDxxY56ggeH1dJxVgCKmunZRN/1M4fe11gcgTrBiXLa3EGggoIFOPZtdot1kCpQuxbYL5C/rRrNKeHBWmTZOcgrx9KDAm9AC1p5/sx4SFVBzhvmECmLLOOcfv7razT2/iLem1VCi2oQG/Hq6w==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1kSJOB-0008SX-8u; Tue, 13 Oct 2020 14:26:47 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1kSJOA-0007YD-VW; Tue, 13 Oct 2020 14:26:46 +0200
From: Alberto Garcia <berto@igalia.com>
To: Maxim Levitsky <mlevitsk@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 1/2] crypto: luks: fix tiny memory leak
In-Reply-To: <20201011102136.622361-2-mlevitsk@redhat.com>
References: <20201011102136.622361-1-mlevitsk@redhat.com>
 <20201011102136.622361-2-mlevitsk@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Tue, 13 Oct 2020 14:26:46 +0200
Message-ID: <w51eem2z4zd.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/13 08:26:47
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun 11 Oct 2020 12:21:35 PM CEST, Maxim Levitsky wrote:
> In the case when underlying block device doesn't support the
> bdrv_co_delete_file interface, an 'Error' wasn't freed.
>
> Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> ---
>  block/crypto.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/block/crypto.c b/block/crypto.c
> index 0807557763..9b61fd4aa8 100644
> --- a/block/crypto.c
> +++ b/block/crypto.c
> @@ -736,6 +736,7 @@ fail:
>          if ((r_del < 0) && (r_del != -ENOTSUP)) {
>              error_report_err(local_delete_err);
>          }
> +        error_free(local_delete_err);
>      }

error_report_err() already calls error_free().

Berto

