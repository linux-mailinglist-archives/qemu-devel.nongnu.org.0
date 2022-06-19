Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EC8550836
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Jun 2022 06:03:56 +0200 (CEST)
Received: from localhost ([::1]:47074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2mAE-0002Wq-MW
	for lists+qemu-devel@lfdr.de; Sun, 19 Jun 2022 00:03:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o2m7L-0001iV-9X
 for qemu-devel@nongnu.org; Sun, 19 Jun 2022 00:00:55 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:42413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o2m7J-0005h9-I3
 for qemu-devel@nongnu.org; Sun, 19 Jun 2022 00:00:55 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 73-20020a17090a0fcf00b001eaee69f600so7391437pjz.1
 for <qemu-devel@nongnu.org>; Sat, 18 Jun 2022 21:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=plvgeHCoTU9C2ThBBfXVshIgrvq1k6CXzx7dAsxZk18=;
 b=qN9b0SuPNrgyNxJCkxP0fvwwEIp2SKniGxHdMksuIu3iXFoTUVeX70DrnvnoobI7+7
 DPNOxv5XbOAwEpeDNLzysdN+olTiMwvZhYh8vPwJS0RB6G4z1XDdg0lrj7MdpKRPLIB9
 kFuFwHccXBf3LS4W4Q7c86KkU4kH9dXt/WOgfI8HLZ1jYkgEd9XtTaTCOQMqtpYH7bOY
 ZaRfXGdwVhrksRDlZ2Xq+ZD0NjeW65WPhCavOu9pi3AiQpZiM0S/387h5ZgS8/R8ZldW
 H5OhNfAc5kWa/izY2zOUaNWEGxVZVRxLbdQGkeMKqXlCCa5epwzkutT+6Boj1fQIGXW3
 1xgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=plvgeHCoTU9C2ThBBfXVshIgrvq1k6CXzx7dAsxZk18=;
 b=mAPWdFnnB6hO0AlfGxXGsgr5EfYlNFMlK6MwZeWyFfEe6yKIiTr268Ktzc+6BFZ9Z4
 a8g9SUSlyR6GW+t348l4nDyso8GHxnrykTmlMW8njLavSVEYru/V2qapYGNYz9+pqd12
 u+AEBIBVgDOm6o2rG385a5Os/spmqBpL/eZ0RtNcNLNukdtr52gleHLSbcONnLQaCKzA
 M6nMhfetY/w8MSyRcCaRab+lKb6z542D+XpCONjBdmOHpSCUi77RbDSf/Fbs8k9na7yC
 9WLasVoBAoCVyZke4udDFpfdVQEhHVoBE5t5x0fULXGfWagwMURcoNGhFDWzO50BSkDf
 vL/g==
X-Gm-Message-State: AJIora9IkGgKIINgfaSAMRpfzH5lSFuGGzj4yBKaa/2MVil6/NYIBMSh
 P6lTONP4TSS08P7yx0LeZxQ=
X-Google-Smtp-Source: AGRyM1vUp2vFTLmc2SZrKWdzVm0F0czMueaecpGG7TRUf21B1j1LfTF6F7iNfEPhs51xu5B+KGKSzg==
X-Received: by 2002:a17:902:f548:b0:167:5c83:3adb with SMTP id
 h8-20020a170902f54800b001675c833adbmr17418958plf.70.1655611251558; 
 Sat, 18 Jun 2022 21:00:51 -0700 (PDT)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 h2-20020a170902f70200b001622c377c3esm6039519plo.117.2022.06.18.21.00.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Jun 2022 21:00:50 -0700 (PDT)
Message-ID: <6fd5c3dc-fe09-a194-5d5c-6a34dbcc6ce8@gmail.com>
Date: Sun, 19 Jun 2022 13:00:47 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] ui/cocoa: Fixed modeswitching glitch in zoomed fullscreen
 mode
Content-Language: en-US
To: Imran Yusuff <imranyusuff@gmail.com>, qemu-devel@nongnu.org
References: <20220619004136.35351-1-imranyusuff@gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <20220619004136.35351-1-imranyusuff@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022/06/19 9:41, Imran Yusuff wrote:
> This applies only on macOS using cocoa UI library.
> 
> In zoom-to-fit fullscreen mode, upon graphics mode switch,
> the viewport size is wrong, and the usual consequence
> is only a part of the screen is visible. One have to exit
> and reenter fullscreen mode to fix this.
> 
> This is reproducible by setting up a Windows 3.11 system,
> booting into DOS, enable zoom-to-fit, enter fullscreen mode and
> start Windows by 'win'. Then you can see only part of the screen.
> 
> This commit fixes this problem, by including one line of code
> which is from the fullscreen mode initialization.
> 
> Signed-off-by: Imran Yusuff <imranyusuff@gmail.com>
> ---
>   ui/cocoa.m | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/ui/cocoa.m b/ui/cocoa.m
> index 84c84e98fc..bd602817cd 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -636,6 +636,7 @@ - (void) switchSurface:(pixman_image_t *)image
>       if (isFullscreen) {
>           [[fullScreenWindow contentView] setFrame:[[NSScreen mainScreen] frame]];
>           [normalWindow setFrame:NSMakeRect([normalWindow frame].origin.x, [normalWindow frame].origin.y - h + oldh, w, h + [normalWindow frame].size.height - oldh) display:NO animate:NO];
> +        [self setFrame:NSMakeRect(cx, cy, cw, ch)];
>       } else {
>           if (qemu_name)
>               [normalWindow setTitle:[NSString stringWithFormat:@"QEMU %s", qemu_name]];

[self setFrame:NSMakeRect(cx, cy, cw, ch)] already exist in the earlier 
part of the method. It is redundant and not a proper way to fix. It is 
necessary to understand why adding the same statement fixes the problem, 
and to fix it without duplicate statements. I can think of two 
possibilities:
1. The isResize variable is not enough to cover all the situations when 
the statement needs to be executed.
2. The statement needs to be executed after [normalWindow setFrame:].

In case 1, you need to assign a correct value to isResize or add [self 
setFrame:] to somewhere else, but not in [-CocoaView switchSurface]. 
Putting the statement in [-CocoaView switchSurface] may cause redundant 
execution of the statement when isResize is true as I explained.

In case 2, the existing statement should be simply moved.

By the way, I have a patch to rewrite the code implementing full screen 
so you may try it. If you tested the patch, please give Tested-by.
https://patchew.org/QEMU/20220316060244.46669-1-akihiko.odaki@gmail.com/

Regards,
Akihiko Odaki

