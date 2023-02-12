Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F91693A72
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 23:22:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRKif-000697-4L; Sun, 12 Feb 2023 17:21:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pRKic-00068u-Oy
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 17:21:10 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pRKiX-0008Af-80
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 17:21:10 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 f23-20020a05600c491700b003dff4480a17so7478573wmp.1
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 14:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Pj98quVBD2bu+HlsBKQzkhqXzI113dwkiTVSoFytyq4=;
 b=raNqmDp4QJG+xMKT5jXZ8RkHs9iEy7KPKQWOXB02I4dgjxrlWvObTczAeH/+rNssny
 fMiN66nECr1RtnqI8muFPZSdRdSuhHtLVcUpF2Xv04MT9srQzC8XMtkTzOHcQZnSqsVr
 NJoDvZFR9He5LsjyF62XqYWUH76ez9I87NLZSTEB22/GdnzeONDnnjPmfy4SQjXJ4JU8
 iOfvNBoPbo3uHB4qfBw7r1cgkNib4LTy9KzGgSFAZk0dbv4LhgFC92L+2Qje2SSRKu5p
 rWwp9r6jtD/VtOPaood6ZlaHtxL7aOuQdYhHXvH3s6LYc7CrHelM0mrlpZmzUAC2if4G
 LbfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Pj98quVBD2bu+HlsBKQzkhqXzI113dwkiTVSoFytyq4=;
 b=6mJMJ91sS5tMVA/Y2Jp3nuPlfpw/6wVRVNqKf6yKXKjk4M3TF648StNqjVjA7T8uKh
 3c61C6tnxqYnsKnAH81t05fNzM2D3VJ3pUfToFFS9oji2qGc2YloA/ReKZu3D8i4uOWC
 OYQKf+Vx/bEDiVJ4McETJrSk1uWy9bWYyBkjcu2b0EYmKXSzRUUir0YOd+gr/VoWtS58
 3K41NfcVW7ZXG8izmY6k/CAHj6Gu8hwyGpJkg5nmDxrBIVqiHPDa3TLyXKMrFgxv/vIL
 /tBmK9eDWnXVhPe0jB1s8g/mSe26WSrOrhfySQ31GVgaxnnqnZJrLB7ee3ZPUMOCYyAn
 5AFw==
X-Gm-Message-State: AO0yUKVn4VNyxexMs8dsTj7oZGTg1dqjZHvitlKiXXtLX2TEiSkt38gM
 oVzHwvTOt5POhg/zoWQ+cdbw9g==
X-Google-Smtp-Source: AK7set/gQCnHpEAquKZmC5k2tLDlRUIYL/cFb2h1DLuVmT2vh29RgiREZQ+92BRsmS/TwWVlD4XhZQ==
X-Received: by 2002:a05:600c:1da9:b0:3df:f3ce:be46 with SMTP id
 p41-20020a05600c1da900b003dff3cebe46mr376535wms.5.1676240463160; 
 Sun, 12 Feb 2023 14:21:03 -0800 (PST)
Received: from google.com (44.232.78.34.bc.googleusercontent.com.
 [34.78.232.44]) by smtp.gmail.com with ESMTPSA id
 c63-20020a1c3542000000b003df14531724sm15838567wma.21.2023.02.12.14.21.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 14:21:02 -0800 (PST)
Date: Sun, 12 Feb 2023 22:20:57 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org, eric.auger@redhat.com,
 peter.maydell@linaro.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v4] hw/arm/smmuv3: Add GBPA register
Message-ID: <Y+lmSTN/mTow+JGe@google.com>
References: <20230210221951.1298668-1-smostafa@google.com>
 <9619db1f-5595-b95b-7643-ae345759a59c@linaro.org>
 <Y+joYrG4aKC5cje5@google.com>
 <e920aa91-c153-0898-d2d3-da141233d60d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e920aa91-c153-0898-d2d3-da141233d60d@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=smostafa@google.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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

On Sun, Feb 12, 2023 at 05:18:33AM -1000, Richard Henderson wrote:
> > Please correct me if I am wrong. From what I see, the initial for value
> > GBPA will be set from smmu_reset_hold which is called from context of
> > qemu_system_reset from qemu_init context.
> > And migration will start after that in migration_incoming_process from
> > qemu_main_loop context.
> > 
> > I validated that also by printing the value of GBPA from vmstate_smmuv3
> > pre_load at migration without GPBA, and it is the same as
> > SMMU_GBPA_RESET_VAL.
> 
> Is that from -loadvm on the command-line, or the loadvm command from the
> monitor?  It's the latter that I suspect requires the pre_load.

I was testing before with migration
-From qemu monitor with migrate command
-Load it from cmdline with -incoming

I tested now with savevm/loadvm from qemu monitor
On vmload command, load_snapshot is called which in the following
order calls:
- qemu_system_reset which calls smmu_reset_hold initializing the SMMU
registers.
- qemu_loadvm_state which loads the saved state.

So From what I see, pre_load won’t be needed in this case also.

Thanks,
Mostafa






