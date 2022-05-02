Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C855171AF
	for <lists+qemu-devel@lfdr.de>; Mon,  2 May 2022 16:36:55 +0200 (CEST)
Received: from localhost ([::1]:36442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlXAT-0005xI-P7
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 10:36:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nlX7x-0004SA-8R
 for qemu-devel@nongnu.org; Mon, 02 May 2022 10:34:17 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:44555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nlX7v-00025d-NP
 for qemu-devel@nongnu.org; Mon, 02 May 2022 10:34:16 -0400
Received: by mail-ed1-x534.google.com with SMTP id t5so6193925edw.11
 for <qemu-devel@nongnu.org>; Mon, 02 May 2022 07:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=pFt3U+uXBudd9ivQWgNA76qz4QWsqeIIxeE1lrRVbRnHyJlpNTqFO3nC/agKd0jN+c
 QM3eztfeosdoDTKGruo4p5jOzT6kCYoYVnT1h8U8SkFMsIdw+OageHCzn3cD0zkx1hF3
 57M+5jmRYVHECtsZBnebhNtFVd3EKY9zvMgsfe/yQ6l5RSQ6ANpxQb6AK6vUvkDv0XZq
 4GPNXknl2loYd3Xsnpg1kx7vid+Yag/7Ss46OPXgRYInV0kKO5+4y3g0MsNfD8rfcZ6F
 d1OAMbOqHdJEIGmWN+FNcIzhIXK41JKgLfJMOutKUm2nnx5qlNEyk0RJSpDANpsErbdF
 DztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=Hqg1OTtDVj0iZ8+5dFjji3usRRF6aiISKt+dCRibjc4890qmETV4UtpRi+kRNiKXWl
 YBJxBH+nxXyQqAKtwBYQrRV1SMfAlE/NRvdJz9zjLj5y98KrX3jgp4Ksw58av2mBTwBh
 uB39OT3JrWPcF2yz021eJUJ7Jg7Hnk3Kw6xBvqLFQKGKBFMIOoYVbzmdw/Xc+pX0imvl
 0AdAv9dJDfdFsjL2vbvGKHLJUWPARLylsGv9lfaH0HWB8tSfTZvgSBcN09F43PN7RL57
 Hww3X0AYU7BLqVgsU3kGy3vCtGSW9QLWDZ/D1tm4kIO8cpASENHdilidVXiICyjrElDR
 XpsQ==
X-Gm-Message-State: AOAM530sYRPO/cx3LdbwbpOWpPDxe+qnPzyznz4ZB9c9caGAKAxMoofM
 BXZCsmrh15B9OjdBNqCPd7g=
X-Google-Smtp-Source: ABdhPJw35xNGvqWdgqianFEnnIc3PXcQ8FX5uuEv+dfBVFn4Cx+bFVcX4GsPC6PFJPCk7t67dAa+Hg==
X-Received: by 2002:a05:6402:11cd:b0:427:bf42:44ef with SMTP id
 j13-20020a05640211cd00b00427bf4244efmr7118693edw.336.1651502054260; 
 Mon, 02 May 2022 07:34:14 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a056402078b00b0042617ba63c0sm6744531edy.74.2022.05.02.07.34.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 07:34:13 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH] Meson: Make mremap() detecting works correctly
Date: Mon,  2 May 2022 16:34:12 +0200
Message-Id: <20220502143412.535557-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220502131119.2345-1-quintela@redhat.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Queued, thanks.

Paolo



