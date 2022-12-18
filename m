Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE4B64FDCC
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 06:27:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6mBD-0008Fz-3a; Sun, 18 Dec 2022 00:25:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1p6mBA-0008Fq-W7
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 00:25:41 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1p6mB9-00016M-1r
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 00:25:40 -0500
Received: by mail-wr1-x431.google.com with SMTP id co23so5965982wrb.4
 for <qemu-devel@nongnu.org>; Sat, 17 Dec 2022 21:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=braap-org.20210112.gappssmtp.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Xq0h+Zkoa36o7w8acqo6BgHQRuZToqCRZLH/6bHVeGg=;
 b=hlBY1qkO9mRhCW18GPeD+iDcBluOkUSOWdyhfG4QId+Ay/y7M68CoNgM364iQPzinW
 P+tHZRNXRDZXSiIykKut3iRowwABLba+NKGz+taKVnpt7ufHmq6Ld2JZ8eEIACdpfo14
 e9GRtq4AvxyORyYeYxHlO3JAyY6uaOsdygu1xJhaw25wklKWtId2WHGwtNf5Vy1O5z1B
 bx0PkDnXaEePjZ+IR3jaxwMUXibDln1gM1O1koPBDJ1XjeAL+OzAzNceqVr+4hvNBYvN
 oesnStszumV8hP2cLD/gYvJttdNxQkZ5s15/36kGZzJMn2CBOR1yiGfDI6ul/m0ROD/h
 /jLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xq0h+Zkoa36o7w8acqo6BgHQRuZToqCRZLH/6bHVeGg=;
 b=gMFfv69JGq3FDUv1T/D6wsxA1vcKdFR9XhYURXKhlCsZhVD8jCCN4PKa/G7q4qt0/Z
 QlOGEu94m3MnhdyreneGZqhOOK96bxIxhbLltWwUU6IA3nS+KxdiqIiar29l4nxyyLq9
 LCeTU9bhXExIKJ99kM++G2XD3eWNwWqp4yaeGpHZGOl/oT5+m4nmVPVu7GX7W8pIl+ZH
 MrcUDjtb5CLW+dYdysBKh4qCSffUDR+BlN9U5IjWawWDL8Tv7vfLL36vJrLyTGUo2uQY
 qoqNZMi6wT8cg0gwzhLevaukljwpM/Apyi6syND+vj/6qUKCOvd4HLaUzd/UlMBsu1gf
 POCQ==
X-Gm-Message-State: ANoB5pmMHiIvfvCtaPgfLNud6NLebIvHFlYngP40bno/17rJbVQEJ0HC
 9+AfdQ9zPrMFc9wfA3Kly82kpg==
X-Google-Smtp-Source: AA0mqf446CvW93GZASMCr7Qt+9mbyGdKS4agBwsxEcrP8aIf5fai5l3xX3I+5KblvlP3dDPqJbhaPA==
X-Received: by 2002:adf:fc4b:0:b0:241:fa2d:deb1 with SMTP id
 e11-20020adffc4b000000b00241fa2ddeb1mr22320202wrs.4.1671341136524; 
 Sat, 17 Dec 2022 21:25:36 -0800 (PST)
Received: from localhost ([146.70.128.217]) by smtp.gmail.com with ESMTPSA id
 bx33-20020a5d5b21000000b002420a2cdc96sm6584115wrb.70.2022.12.17.21.25.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Dec 2022 21:25:35 -0800 (PST)
Date: Sun, 18 Dec 2022 00:24:43 -0500
From: Emilio Cota <cota@braap.org>
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Subject: Re: Plugin Memory Callback Debugging
Message-ID: <Y56kG439aHBbKVLK@cota-l14>
References: <Y3QNRWUK8BLRQlaQ@strawberry.localdomain>
 <878rkbalba.fsf@linaro.org>
 <Y3vdIHJrR1k1lmf8@strawberry.localdomain>
 <871qpwc6i6.fsf@linaro.org>
 <a0eae94e-eafa-e206-be32-e2ce58e466d2@linaro.org>
 <Y3zxW/vFsxCuDFW+@strawberry.localdomain>
 <Y4Ztn91bFssBdbmR@strawberry.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y4Ztn91bFssBdbmR@strawberry.localdomain>
Received-SPF: softfail client-ip=2a00:1450:4864:20::431;
 envelope-from=cota@braap.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Nov 29, 2022 at 15:37:51 -0500, Aaron Lindsay wrote:
(snip)
> > Does this hint that there are cases where reset cpu->plugin_mem_cbs to NULL is
> > getting optimized away, but not the code to set it in the first place?
> 
> Is there anyone who could help take a look at this from the code gen
> perspective?

Thanks for the report. Just adding assertions was enough to uncover
several bugs. I did not reproduce the use-after-free, but by calling
reset from a callback it's easy to see how it can occur.

I have fixes in https://github.com/cota/qemu/tree/plugins

Can you please give those a try?

BTW I created an issue on gitlab to track this
  https://gitlab.com/qemu-project/qemu/-/issues/1381

Thanks,
		Emilio

