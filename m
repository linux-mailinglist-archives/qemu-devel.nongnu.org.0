Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C67EA2E84AE
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jan 2021 17:59:16 +0100 (CET)
Received: from localhost ([::1]:44602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvNlj-0005U3-Sh
	for lists+qemu-devel@lfdr.de; Fri, 01 Jan 2021 11:59:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kvNjJ-0004Yb-Vl
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 11:56:46 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:53379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kvNjE-0002Fl-7R
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 11:56:45 -0500
Received: by mail-wm1-x331.google.com with SMTP id k10so9300425wmi.3
 for <qemu-devel@nongnu.org>; Fri, 01 Jan 2021 08:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=S81Q+TPQriBaFquVl83oN4LnJgr0AEMNOKSuRiZYmH0=;
 b=rkKKIy84ebex4keTCutv1Pju9pjgtbJjHGKrPN7IVjc0fOoN9RBPyKS48tXUzCbV5m
 Ic+C9EO5VfUPvnCTfEBbPgIn53VmBuFGb617eAxGdedjixhBjUyhBr88tdenyEh7b8B6
 Fc4rDoh9ZSH9JfdjzHzbzgIXVh6jXGLHXcgROrG/bh2csvgGUEgu2BlHQeUAdIjt+S1w
 R19fN1aYtHuIbhoKF0SJ6IvRTh3Gxwjz3CHAkajluZr9xUzGVYuoAKXf3N9zV5tbRp3O
 Lcm2kVZvW1RmqUQEOtfWBHWwubXlHS5LpOx3wgOHW1c4ug6zzt4KMN69+kNL7sSUEuv9
 EntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=S81Q+TPQriBaFquVl83oN4LnJgr0AEMNOKSuRiZYmH0=;
 b=Scp00f15Ndj0iweg1rbqCtJOOfbjk7qlAesErR7ZFi2yotOekPW36ZxxwNZmvuZ4Fc
 uesIIcjgGifY7mpm2AfcICVnSq3yhWTY0iWFVxt9HnlBXtNU97RTn2Wux+MkoGpvnQAJ
 DxydTg/1V0CpvWPxLdlYhbZMbJDrnsS7rilLN15w0hTV8odxtIIWkHaFDNhwWvW6Lerm
 Ydnnx0NXhefKCs688JsfBY8+67l+B6/qr90FKlWiAqFpfwvL02k3ykrsxUJ5nP7PdhRu
 Mx89+yBGTaHlI+ZNa3ultDe3PYAIKHkBffwLYnmkL+Lxw4CRyQQoPtF/05FqHl7XU0bz
 2YWA==
X-Gm-Message-State: AOAM5337io7pZ+AiJAAFWw2FCorNsBfOV/2EPwDXE57xbW8SEHLLiw3z
 sHo6VCET5CZ1WA7dARll/j4=
X-Google-Smtp-Source: ABdhPJyRuYy0PTEBq+587Jn8nILo89WtQlyCsBPWRGRbxqWmtMVJqMvOFfXTwtXxTKzRhRnSz20W4Q==
X-Received: by 2002:a1c:9d8b:: with SMTP id
 g133mr16537665wme.189.1609520199048; 
 Fri, 01 Jan 2021 08:56:39 -0800 (PST)
Received: from [192.168.1.34] (239.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.239])
 by smtp.gmail.com with ESMTPSA id a17sm77503502wrs.20.2021.01.01.08.56.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Jan 2021 08:56:38 -0800 (PST)
Subject: Re: [PATCH 06/25] esp: introduce esp_get_tc() and esp_set_tc()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net, laurent@vivier.eu
References: <20201230153745.30241-1-mark.cave-ayland@ilande.co.uk>
 <20201230153745.30241-7-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <cab20a7f-83ff-6fdf-20ce-1f3a5b73b4db@amsat.org>
Date: Fri, 1 Jan 2021 17:56:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201230153745.30241-7-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/30/20 4:37 PM, Mark Cave-Ayland wrote:
> This simplifies reading and writing the TC register value without having to
> manually shift each individual 8-bit value.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp.c | 34 ++++++++++++++++++++++------------
>  1 file changed, 22 insertions(+), 12 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

