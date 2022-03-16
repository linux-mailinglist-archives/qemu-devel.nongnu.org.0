Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6100C4DAEB8
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 12:13:16 +0100 (CET)
Received: from localhost ([::1]:33766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nURad-0006RJ-GJ
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 07:13:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nURYm-0004uG-22
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 07:11:20 -0400
Received: from [2a00:1450:4864:20::630] (port=47085
 helo=mail-ej1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nURYk-0004N0-B9
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 07:11:19 -0400
Received: by mail-ej1-x630.google.com with SMTP id qx21so3320946ejb.13
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 04:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=pCWCtPdSyGfvAB74Hv9J29QgDjuvsGxrnz4nDAxcCvDZCywXm4bIDdZP7xAtqsoeCL
 W7lrXZ8NDrgrThQ4bE+KDJJjqx5rLNBU8otTw4823S+4u2m/DcroviQDKud+d8jndis7
 LKJDqqJa+1k/VmiBZ5K3jTqHCAGQ4lQyzbET4wrc5b5BzLM37YP0HZSkRDt46CDUq0oM
 L+UaxT1I9ICKqdfNTZvU8r8sM8eY6ExWQlFA70mhEt324gC7B80LH9kiFAVrnTETLjKX
 MpqTFYk2zDjldEryh5V+9YsqZRFdeW8dmkg5lxsP/cRemj4HmEUHbdRRnRLRk+54FohS
 bkDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=lMuYoEsdJSMEXsFzsqcGovw+Glpg/mZOY21XNk0R796NfB8fqDZ9D3VQDEAPBcYeQp
 htWbhFmqKmNGozfRjWSEfQs4E7njdtHIn1cu3f3laXpjnXtiTlES3hi8rpyKbI76iSUB
 TXdCL7fMP3M3ZIiCNGJRaNhBjeWEdfrcRU/9ed6CDDhhevqD/VShHO5vRPsryjvbFC6I
 Uw1klsWv0gwUpl7wmClxThvjKuHBdNZHWQs9zUS2UWk7NQn63ndgcoek8xq1uTsuoFIC
 TFZ+m7KVZAT/MD5wfV2/sZwy5KKUrhFLzzTMfS9wAvqDycen+mtIv6jOkYfenZ1ckME2
 NLIQ==
X-Gm-Message-State: AOAM532JB3W7K8oQ6qdO46ocJbd7C62AJyVtTSPoZiFuHWe/SmbE3Tw5
 b6+IFHuGYWBf87XOU5kDgl0=
X-Google-Smtp-Source: ABdhPJyma68Lbv5mL5h1VC3fbsY4D5GKIJC6gGXHEsmVYqDgQdbBqMeDgOtb1oxC4pSVqIFXPHdBpw==
X-Received: by 2002:a17:907:334c:b0:6cd:76b7:3948 with SMTP id
 yr12-20020a170907334c00b006cd76b73948mr28825344ejb.55.1647429076660; 
 Wed, 16 Mar 2022 04:11:16 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 e22-20020a170906505600b006da7d71f25csm757300ejk.41.2022.03.16.04.11.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 04:11:16 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Jon Doron <arilou@gmail.com>
Subject: Re: [PATCH v3 0/4] HyperV: Synthetic Debugging device
Date: Wed, 16 Mar 2022 12:11:08 +0100
Message-Id: <20220316111108.1724572-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220315153220.953556-1-arilou@gmail.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::630
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: pbonzini@redhat.com, vkuznets@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Queued, thanks.

Paolo



