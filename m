Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B96942657F8
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Sep 2020 06:19:14 +0200 (CEST)
Received: from localhost ([::1]:54342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGaWn-0000mG-5L
	for lists+qemu-devel@lfdr.de; Fri, 11 Sep 2020 00:19:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kGaVt-0007vx-2K
 for qemu-devel@nongnu.org; Fri, 11 Sep 2020 00:18:17 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:38184
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kGaVq-0001x3-TN
 for qemu-devel@nongnu.org; Fri, 11 Sep 2020 00:18:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599797893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tX4xfaZDYxhcllxVB5LE7NO7bf53MuHSfpRLwFrwKe4=;
 b=fmjPnIIrergkwcvgt5dJp6+tvU2897UCAK4el+ttWcqFGOpPFFvMKfC0vxK5uAzNxDl94d
 e9FXDRJpd6PWN3nsPbea3dcqdssjUi6btHNDzwEFGUiDDMp3Pg6MTcn0/G7Wh4LFtEcjQP
 II5DOQeuRv0F0shUOjtZmaJkkdzY9Gs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-26IgmYYeOxmk-QHNCNCbFw-1; Fri, 11 Sep 2020 00:18:11 -0400
X-MC-Unique: 26IgmYYeOxmk-QHNCNCbFw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49E0F1084C82;
 Fri, 11 Sep 2020 04:18:10 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-46.ams2.redhat.com [10.36.112.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0729960BF4;
 Fri, 11 Sep 2020 04:18:05 +0000 (UTC)
Subject: Re: elf2dmp: Fix memory leak on main() error paths
To: AlexChen <alex.chen@huawei.com>,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>
References: <5F463659.8080101@huawei.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <c9a661c3-7a86-8ae7-6304-6110d0bfb461@redhat.com>
Date: Fri, 11 Sep 2020 06:18:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <5F463659.8080101@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=207.211.31.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/10 22:33:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.576, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: zhengchuan@huawei.com, QEMU Trivial <qemu-trivial@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/08/2020 12.15, AlexChen wrote:
> From: AlexChen <alex.chen@huawei.com>
> 
> The 'kdgb' is allocating memory in get_kdbg(), but it is not freed
> in both fill_header() and fill_context() failed branches, fix it.
> 
> Signed-off-by: AlexChen <alex.chen@huawei.com>
> ---
>  contrib/elf2dmp/main.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/contrib/elf2dmp/main.c b/contrib/elf2dmp/main.c
> index 9a2dbc2902..ac746e49e0 100644
> --- a/contrib/elf2dmp/main.c
> +++ b/contrib/elf2dmp/main.c
> @@ -568,12 +568,12 @@ int main(int argc, char *argv[])
>      if (fill_header(&header, &ps, &vs, KdDebuggerDataBlock, kdbg,
>              KdVersionBlock, qemu_elf.state_nr)) {
>          err = 1;
> -        goto out_pdb;
> +        goto out_kdbg;
>      }
> 
>      if (fill_context(kdbg, &vs, &qemu_elf)) {
>          err = 1;
> -        goto out_pdb;
> +        goto out_kdbg;
>      }
> 
>      if (write_dump(&ps, &header, argv[2])) {
> 

I think this could go via qemu-trivial (now on CC:).

Reviewed-by: Thomas Huth <thuth@redhat.com>


