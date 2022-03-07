Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FAD4D07BE
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 20:31:15 +0100 (CET)
Received: from localhost ([::1]:57888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRJ4c-00088I-JB
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 14:31:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nRIza-0003EJ-PU
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 14:26:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nRIzX-0007V4-Dx
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 14:26:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646681157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RCdEa0tiL6ft6GOwoW+gQh3e0OL4EzOep5Mpu4N9xtg=;
 b=TG9PQtYuyiWZOHC6Bgl9x6rfD21oIsXlcI1VXxq6sGMt79C56ct+AXXT6aaBDclqaL7hti
 VRW/6AO3F1OeFXNJXyCNTTeGiva9AiusyV+ogU9TldX9qkqir/FoZhrQUjvn1lZRRzz9/G
 Ba0pYbbQgJkSbOoNQ28uIpE+CHloRig=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-313-7QCV9AgbMjyHECHlZcf_1w-1; Mon, 07 Mar 2022 14:25:56 -0500
X-MC-Unique: 7QCV9AgbMjyHECHlZcf_1w-1
Received: by mail-vs1-f69.google.com with SMTP id
 i190-20020a6722c7000000b00320cf551813so296116vsi.3
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 11:25:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RCdEa0tiL6ft6GOwoW+gQh3e0OL4EzOep5Mpu4N9xtg=;
 b=5x2pGKqPPNT6Mep3tBVScfBWH8eYzL0nAH/LNpo4BEmIFdd89QY54COKJQN+QCB1ew
 5gMF9r+JDva9KhAtKh4JluZuNFy7hBvHZOTjmFgPhduANea+ckg3XhUOAMlpbg0cNR8a
 Nffxv9u5AGgRRIi+/ogqv02LFByQ93sxT5WBKZOsiJS1LcsE4UZv/8jHnM18uMGpNBZI
 ZUdRRiBlAmjoWq0VkaaQsJ/im6W7DjLAo/4pjCe3iQBPB8swura2GriBdl3l+pYd5TNR
 2VCtHHodaRDPvtX12L8+rFgwJz3rw3kshKA4xQINInylpyL8XXfoEOhGphLvtM4ha2Y/
 GX1w==
X-Gm-Message-State: AOAM532WMbe7zbqAeYq0AOAtZlvs9bUbU4g08mzJ0l59nxJuhuCCE3T0
 0eWL5V7nSrLrIzNTqrtTja7wNFpttYfsMG6J16ftn5F721brnFvi8kMqeXwK9PhtueS0EaAyk+W
 pRqnw9bMVdW6Rvdc0vH7UD8iNFpDhcXM=
X-Received: by 2002:ab0:67cf:0:b0:341:257f:ce52 with SMTP id
 w15-20020ab067cf000000b00341257fce52mr4303358uar.109.1646681155981; 
 Mon, 07 Mar 2022 11:25:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy1cyS5iBPzavUnhA/p2oyuDWj2QMGrK13lWskbCo+vUmA/ipx4UXb9t5DrETNpMqYg6sbwhUTgY3rsBKPk1Xg=
X-Received: by 2002:ab0:67cf:0:b0:341:257f:ce52 with SMTP id
 w15-20020ab067cf000000b00341257fce52mr4303353uar.109.1646681155757; Mon, 07
 Mar 2022 11:25:55 -0800 (PST)
MIME-Version: 1.0
References: <20220305105743.2384766-1-peter.maydell@linaro.org>
 <20220305105743.2384766-2-peter.maydell@linaro.org>
In-Reply-To: <20220305105743.2384766-2-peter.maydell@linaro.org>
From: John Snow <jsnow@redhat.com>
Date: Mon, 7 Mar 2022 14:25:45 -0500
Message-ID: <CAFn=p-a69z8v_rEBYLCsvMaOj_0uL0JOmUw+KZ7EgT-y3GBVjg@mail.gmail.com>
Subject: Re: [PATCH 1/3] nsis installer: List emulators in alphabetical order
To: Peter Maydell <peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel <qemu-devel@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Mar 5, 2022 at 5:57 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> We currently list the emulators in the Windows installer's dialog
> in an essentially random order (it's whatever glob.glob() returns
> them to, which is filesystem-implementation-dependent). Add a
> call to sorted() so they appear in alphabetical order.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  scripts/nsis.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/nsis.py b/scripts/nsis.py
> index 5135a058316..383bef70332 100644
> --- a/scripts/nsis.py
> +++ b/scripts/nsis.py
> @@ -34,9 +34,9 @@ def main():
>          with open(
>              os.path.join(destdir + args.prefix, "system-emulations.nsh"), "w"
>          ) as nsh:
> -            for exe in glob.glob(
> +            for exe in sorted(glob.glob(
>                  os.path.join(destdir + args.prefix, "qemu-system-*.exe")
> -            ):
> +            )):
>                  exe = os.path.basename(exe)
>                  arch = exe[12:-4]
>                  nsh.write(
> --
> 2.25.1
>

Do you care if this order is dependent upon the locale settings of the
host machine?

If you don't:

Reviewed-by: John Snow <jsnow@redhat.com>


