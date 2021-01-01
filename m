Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E9D2E85AE
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jan 2021 22:20:42 +0100 (CET)
Received: from localhost ([::1]:43076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvRqj-0004dM-IW
	for lists+qemu-devel@lfdr.de; Fri, 01 Jan 2021 16:20:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kvRpm-0004Dy-DJ
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 16:19:42 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:54906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kvRpk-0003OK-Vh
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 16:19:42 -0500
Received: by mail-wm1-x32d.google.com with SMTP id c133so9795443wme.4
 for <qemu-devel@nongnu.org>; Fri, 01 Jan 2021 13:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rqZOQPcgjmowePA1PArXCWV9Lf4fa2atdUCBVyfTut0=;
 b=bkqW/elSmaXxj3qmLsVqgFSpX6dNRPOU0dqT+t2yllOFWSdMVSRLjFIoKO7X29useu
 QRzFnOBXSltZjRcQH2H0rXCwl78bw1nlOZVb55dckUX7K+9ngYBlCW748+MHcenhAZtB
 DUt7SzHVnJKqMlH8Gx/FQYCIa9brdrQxnLbj1FpKriMAolXiJdVdPzcP5cti/Rec04Ey
 EMxWMcEruvt0O6wnXQoISdfpfiwaPEDvrNoJUm1zUXb3DroJydgKOdQ6ljvmSAbDVdtw
 HzLgi3BhKdVgJ6EFMHPB7iNJbZ8OUQF/FK+tPCVCM+ejT8LoJ+9ZfuqBnTnVma0YZTDY
 0vAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rqZOQPcgjmowePA1PArXCWV9Lf4fa2atdUCBVyfTut0=;
 b=boFcLoGO6oJtgkCUrJXf0GGzyTY2/miAxIIg0v7L7HbSDx0lNySZEli1F+aeKwNHEB
 vlFSNTRH1iLnQljGSvGWXWokGZjZN7yi6rcHnNYadZgQy1YvRxF5HR5ShPiAuZE2mgXk
 hl6EQ/HdFvRfuEeq1yED2pJzJ6G/qXIrlkCF8l/JUKXdC6Bk2uXRlPb1bFRdIb91NdGa
 pUuklC+CJVE+5BaNi59hPYnicnrWdkiZUka/gF8vRDZsQEnB7GiBV3Vlfl4EhJj5Gi2V
 zx8eIW96b2F1P6pdRTbhld7pgCcjIVe2qviDb+nw5A63rkRIcBUXTWYd9tqUwDyXFFZw
 qUXA==
X-Gm-Message-State: AOAM532wLpcq0tQoXSyzZ25yIG5xCF6ZUyS5F0vqkTFvrUUrmzSvMBXR
 YAKrzqv5qxW93HNJnYve4jY=
X-Google-Smtp-Source: ABdhPJxX7TibJffLagA+L+HooKSA7VH/GwUU+/qEK5ms/h7H+3dZzVkY3gQlfumf1ZjMZft8sptaeg==
X-Received: by 2002:a05:600c:410d:: with SMTP id
 j13mr17132377wmi.95.1609535979460; 
 Fri, 01 Jan 2021 13:19:39 -0800 (PST)
Received: from [192.168.1.34] (239.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.239])
 by smtp.gmail.com with ESMTPSA id r15sm74143923wrq.1.2021.01.01.13.19.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Jan 2021 13:19:38 -0800 (PST)
Subject: Re: [PATCH v2 06/10] audio/via-ac97: Simplify code and set
 user_creatable to false
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1609121293.git.balaton@eik.bme.hu>
 <1ebc069cbab65386d01125f6b0997a88e560d582.1609121293.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <acda35c2-9c82-e8e1-ee41-32fc92e07a93@amsat.org>
Date: Fri, 1 Jan 2021 22:19:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <1ebc069cbab65386d01125f6b0997a88e560d582.1609121293.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.749,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Huacai Chen <chenhuacai@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/28/20 3:08 AM, BALATON Zoltan via wrote:
> Remove some unneded, empty code and set user_creatable to false
> (besides being not implemented yet, so does nothing anyway) it's also
> normally part of VIA south bridge chips so no need to confuse users
> showing them these devices.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/audio/via-ac97.c | 51 +++++++++++++++++----------------------------
>  1 file changed, 19 insertions(+), 32 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

