Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B2B3655CD
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 11:55:54 +0200 (CEST)
Received: from localhost ([::1]:43038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYn6n-0001A6-5U
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 05:55:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYn4M-0008Nd-Ti
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 05:53:22 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:55021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYn4L-00031b-03
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 05:53:22 -0400
Received: by mail-wm1-x32b.google.com with SMTP id k128so19764544wmk.4
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 02:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=58oByHRQENKiTCsgJ5OOlEzdGn1qtJ2SPqsRrI/y+oY=;
 b=PuHnrfUTF8CPqsUQAYkQxm3rtxZAm+ldb55WVhu6H4s4VcEeIt7rMdlbybYSkHc667
 W2Q6M+gBj2xxDyZWNGv+d6JBw5c3VeDgpBw0wVjLmHKsmhQzL0oybWqJz7LIG4xOkg0/
 aWlq8i2e56vEVTFzb+F/n//CTNgUlYd9dpa5lMFbB8OFbbEf3dsNAfKKE+HK0xOZp0ic
 Cb/E4mrw67Fh6p8EMb/7vL+acN4xdWsztAxiLc8n63FXqHLcNpfaoHmGc7dCB6CwWbRk
 5F1BDn1101m0jpzP3tluzNxudTKuh6dlkNW5kPFtUbjzqXCwRje4Hmmu425yZYtWe1R5
 e+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=58oByHRQENKiTCsgJ5OOlEzdGn1qtJ2SPqsRrI/y+oY=;
 b=PPuQDQimvAxBLEOvi1tgLz7k5k8vnCYaWjoYwmfQQLrkb7lGTjq2VoVBwjzciNKysH
 94tX5JMLJ3rD8oBttrYzqCq7JNoez+Hx1VYrqZT0MsAUDivb2sRGX4yjUEONHOhtZPL/
 DVgsVtp3fqM7Q3l7Aqi+4P4X2U56tHfPMnQTUO3ZOFarY2x9euAvD5lyxx/oeYiZmZlg
 t2LzO0VaunyIcu5YzM7w4u294aKGXYrcCIHfnKu10gJKPjPZBFWD++nH5S4HI9UrdYMd
 jqo4M5EFWB/Ws+ixZB3ODUCP5sC91UTqeZAzubIKbarPp8fhz+KAKH0XckwizblSjVgC
 MkJw==
X-Gm-Message-State: AOAM533FIQfMjTgfZM/yNM6B+6I6QFW1WIuBtF1CPNtxKbyLuDhzjiPa
 MkSsk8qHjGZKU/uf89V7L1EZQw==
X-Google-Smtp-Source: ABdhPJzusOGhrcVuu79tL439TiZyZYhq4Ep3ODgcXMTbciyjeYMg0BLIc0L3oDXDKxEWexwpJXsvDw==
X-Received: by 2002:a1c:21d5:: with SMTP id h204mr3491869wmh.95.1618912399326; 
 Tue, 20 Apr 2021 02:53:19 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h1sm2746441wml.38.2021.04.20.02.53.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 02:53:18 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AF9221FF7E;
 Tue, 20 Apr 2021 10:53:17 +0100 (BST)
References: <20210416162824.25131-1-cfontana@suse.de>
 <20210416162824.25131-5-cfontana@suse.de>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v14 04/80] target/arm: tcg: add sysemu and user subdirs
Date: Tue, 20 Apr 2021 10:53:12 +0100
In-reply-to: <20210416162824.25131-5-cfontana@suse.de>
Message-ID: <87v98h8epe.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-D?= =?utf-8?Q?aud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

