Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9705F6154EB
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 23:25:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opzfQ-0000Pq-J3; Tue, 01 Nov 2022 18:23:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1opzfO-0000PY-RD; Tue, 01 Nov 2022 18:23:30 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1opzfN-00056d-1p; Tue, 01 Nov 2022 18:23:30 -0400
Received: by mail-yb1-xb30.google.com with SMTP id j130so19014660ybj.9;
 Tue, 01 Nov 2022 15:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZTh+bsIBCIPi6s9oU/UBa5V9v74ADhpE3WZBx091S+g=;
 b=geHEYWAoekd44RJsJXe0qmAjAZTQDzeP/VDMKAmJPNyc89zTIVUKYKoOGiS10LqACn
 ZXWgCu3sajd9Gwpv1mQ0EbMQVBsCguLqhFhIkv933RJq79vLwfHDhtNRk7B9vtDSUhxU
 BC7PQo6bNfL/F+rxOgFl47BVbKDwGbidbjJtB5X3QIYgdtpOdotjAORpGaHZWQ1ICprm
 uYefyTA+onDz/o+GrW1Aai56CGZmcA9ec9ZvOK+ryiW97ocz0W7ubfbFbZKuwamX07ei
 9p+yVGTf7uUYraBTPzu6lE2ZDs2BgvWAyehNZrlsNmr9KPSFLsKCk/YbZkh3pTYH5cDt
 KkDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZTh+bsIBCIPi6s9oU/UBa5V9v74ADhpE3WZBx091S+g=;
 b=QgHAcgahTT65NLMn9o5sAYdific+iHyyrg7hA6XCik4hX0ZUbVnHFQoLfjlhQ6lTT8
 xR/ef12fzduJtYUePBpEEkTb2HB1bP6G1RYASissPeX3NR3lXiQxWcRp2VrZP0RREHw9
 k8cYtLjzC9Xasf8SAr5CMrDCebX47RPSza+dXsTEcXl/98dKxuvChomuiCLsS4beAXSl
 Y1y9xmFPIPvPyQQ9y6eht6VNyy/NH+7yb+XGQbYYupPiQcpHzSk9lwqUQUN4bTgzIY53
 JNkZ8MwZrKKIX/ZNcd8rlt2MO0iApR83htZ1hvbq+AkUivJwBuKiItuwCg+hWX3fTtfY
 2wJA==
X-Gm-Message-State: ACrzQf3O7bQhbLdPEU31UeqG/H7MzpFjwVYOLLeGCV7lBYmYoxmDHlyv
 v2pl24bFtDcjCtAkjOGM6m3UmcqTNSfTDN2qGm0=
X-Google-Smtp-Source: AMsMyM6Bm/OwtZPfhkVAaobRbw4BjTzL8fYBc4dL5CQENcMbpI4DYNZ4ReBO/x+iA01Id3FDZ7Cq3BvK699/LeeRZao=
X-Received: by 2002:a25:4fc1:0:b0:6bc:c570:f99e with SMTP id
 d184-20020a254fc1000000b006bcc570f99emr19884592ybb.58.1667341407177; Tue, 01
 Nov 2022 15:23:27 -0700 (PDT)
MIME-Version: 1.0
References: <20221028163951.810456-1-danielhb413@gmail.com>
 <20221028163951.810456-60-danielhb413@gmail.com>
In-Reply-To: <20221028163951.810456-60-danielhb413@gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 1 Nov 2022 18:23:15 -0400
Message-ID: <CAJSP0QWiE2gmUB4Fcb_TdS1SzXiS3fFvjoCXjqYbvts0Nvb+HA@mail.gmail.com>
Subject: Re: [PULL 59/62] hw/block/pflash_cfi0{1, 2}: Error out if device
 length isn't a power of two
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, stefanha@redhat.com, 
 Bernhard Beschow <shentey@gmail.com>, Bin Meng <bmeng.cn@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

There is a report that this commit breaks an existing OVMF setup:
https://gitlab.com/qemu-project/qemu/-/issues/1290#note_1156507334

I'm not familiar with pflash. Please find a way to avoid a regression
in QEMU 7.2 here.

Thank you!

Stefan

