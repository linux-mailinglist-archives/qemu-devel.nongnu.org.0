Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF45D6A6C21
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 13:09:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXLGQ-00053F-FU; Wed, 01 Mar 2023 07:08:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXLGO-00051R-LW
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 07:08:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXLGL-00040p-VA
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 07:08:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677672527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=RLw0xA5K0Ct7qqXl7xhDELJ+M+JWWJ1vpXAfoJ/z+m6v70FSMyxTF7tddpsRBrJx8q1sZm
 b6aHv6kObhrtXhzPVfUTNrJf4SpJNCdC5N+g30fDTf/OzCXOwn4B+i56vZSAKXXIMpUJuO
 LtV6FpRMzbHZ6cA3MEwi7JbNwGxx7X4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-333-sboOQdBuPiKFT9ULVUvwdw-1; Wed, 01 Mar 2023 07:08:45 -0500
X-MC-Unique: sboOQdBuPiKFT9ULVUvwdw-1
Received: by mail-wr1-f69.google.com with SMTP id
 n6-20020a5d51c6000000b002ca3c48ba46so2265858wrv.4
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 04:08:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=Hw3keeXKYtIcnJpBWGXDY/0Fbw3WEuqxNM3luAENBFPmOWC9iUiBa8EEJ7SSuMTdtz
 HtpfzEmh6QRBGn+lHVo1uI61ZkbDhFLgJwETOpY19roqwbqdgj2RZlGYg0usbU3MUGfA
 b/bxLgSbs0qBO5LcN1gKPV8H1s6tJZOw0zL9bWDzG/jYSKE4ebVzBqiNOspIaqRnoN8R
 qTvjezcIbvlFwF5ePtgE0yjjGTxbUbIkiF+8sxkqPVdAp9Su+ZlqQRuxiJ+Rxs8hqrDi
 jE7K2cNtrfg8+b/dDywwD/hvPyd0FAK87WR01CQpkRZ/DNMiGWXMjpQIWL1WOT4xcxvC
 nYYw==
X-Gm-Message-State: AO0yUKW24/vdesahMNZhBcjXo3AO1gsaB1Adih7T0aovS1HwZUzThGnD
 XnFwtGc+HS6Q8/KFOty881WdwqVGAVt4z7QMLtDVhiV5BDyXhPYfcrn5hFrJNsklMb/gQz9T+Dz
 laFZaEMsvbnHRpzU=
X-Received: by 2002:a05:600c:4d20:b0:3eb:2e66:8 with SMTP id
 u32-20020a05600c4d2000b003eb2e660008mr4772925wmp.35.1677672524840; 
 Wed, 01 Mar 2023 04:08:44 -0800 (PST)
X-Google-Smtp-Source: AK7set9E5lh2dzM284XsN5TJRnqjbcH3gMadCPGOxqAeVvKM2scyr2DKWbhxxb0tPQuV4vRPdpHE5A==
X-Received: by 2002:a05:600c:4d20:b0:3eb:2e66:8 with SMTP id
 u32-20020a05600c4d2000b003eb2e660008mr4772910wmp.35.1677672524498; 
 Wed, 01 Mar 2023 04:08:44 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 z7-20020a05600c0a0700b003dc434b39c7sm2846033wmp.0.2023.03.01.04.08.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 04:08:43 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH] Makefile: qemu-bundle is a directory
Date: Wed,  1 Mar 2023 13:08:23 +0100
Message-Id: <20230301120823.33561-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230301111910.1660-1-quintela@redhat.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Queued, thanks.

Paolo


