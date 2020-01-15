Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B36813CB04
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jan 2020 18:29:37 +0100 (CET)
Received: from localhost ([::1]:58074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irmU4-0003rQ-3V
	for lists+qemu-devel@lfdr.de; Wed, 15 Jan 2020 12:29:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45256)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1irmTC-0003ON-9d
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 12:28:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1irmTB-000692-41
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 12:28:42 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:41403)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1irmTA-00068M-SO
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 12:28:41 -0500
Received: by mail-pl1-x642.google.com with SMTP id bd4so7105553plb.8
 for <qemu-devel@nongnu.org>; Wed, 15 Jan 2020 09:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ASaSkeThfmLst7zANy5Q8D/BLEpt/ttPyBlD2zckJ7g=;
 b=nethbzO7x2CtfEB+IUizbnrsOnNZEdd2nGoW8oyvHq7K62rZ4Z5B+CMNNefzKxm5uf
 QNNc4Mk2r9SYqTTzc6qRTehP5krgtM1ZVatCgzwGKWT6M0ej6gRL+J5FZKCVp9ljN/Se
 AKbHqI58dMT8RolAxQJPZnnSdb1aZ6i1/Nqd3fPZcVGJATr11zzPzKqPo5iCcro1FXGv
 JQ/pK/lRr73Gnj+TG/31jtIl/rijA7UEXC7vL3eaRe02LmmzGLapFplB4Tb7ONx2oLfb
 WV2fdgAALX1OeZ6tNirSb6tFk3zNfs2txl+RDOCVouYtXuT9S4YqZXFIi8LIXF41wwbl
 b0oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ASaSkeThfmLst7zANy5Q8D/BLEpt/ttPyBlD2zckJ7g=;
 b=X4hR4JNwIcbQVHS3BtbX3rfxd7xy/dEjchw/Ih4+0GKBooxMsy81SfJUwC5lsW1vTJ
 KODmLi8ZVivWCLfUDmrBYXla4qAIHpcR0hN+CRUlkAnqKEfFR3acIx0SjLJc5kUb6hd5
 mm0bWPutD6r2pRmBisH7qjhzu5r5ZyhvkQbtSUtnuEa2Bd4Y10xHcXY0nDaWi4fCbB67
 6TC0y8fF9fvN44n/Fhh/FWPaJYM/sRUDNqcRQTeRe9A78oEGLNeuL2T72htDACIEsQ9a
 JCE6qSYG1E+mF3Zv9aOsuNO0imtCqHegATEIi3UW6GvZ5kp7iE5SvCu2d+8Td69v6JtV
 ZNwQ==
X-Gm-Message-State: APjAAAWUJ3CI0sbRpUWOwxA8j+WM4Y+w17AnRtVT99RcXmDEBoudzha5
 E41IZ2PDjp6KtMlDq0YUaaR6hA==
X-Google-Smtp-Source: APXvYqyIvVWwsMTo4CWFSKDWuNK7QO+uvPxKKsWxTIgKG8Kd6P4VhgdEM71LUIIALV/kYf1xiDqDoA==
X-Received: by 2002:a17:902:8642:: with SMTP id
 y2mr32864705plt.306.1579109319420; 
 Wed, 15 Jan 2020 09:28:39 -0800 (PST)
Received: from [192.168.3.43] (rrcs-66-91-136-155.west.biz.rr.com.
 [66.91.136.155])
 by smtp.gmail.com with ESMTPSA id d3sm21919952pfn.113.2020.01.15.09.28.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jan 2020 09:28:38 -0800 (PST)
Subject: Re: [PATCH 0/3] linux-user: Implement x86_64 vsyscalls
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20200114210921.11216-1-richard.henderson@linaro.org>
 <7f8c782f-6ee2-bc7c-db94-4b0784ed58eb@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d47ef447-6888-aae3-a1b0-25fe35686a8e@linaro.org>
Date: Wed, 15 Jan 2020 07:28:34 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <7f8c782f-6ee2-bc7c-db94-4b0784ed58eb@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
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
Cc: pbonzini@redhat.com, riku.voipio@iki.fi, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/15/20 12:14 AM, Laurent Vivier wrote:
> I'll take this series through the linux-user branch except if you prefer
> to do the pull request yourself via another branch (x86 tcg?).

Through the linux-user branch is the right way, I think.
Thanks,

r~

