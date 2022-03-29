Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2FD4EB000
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 17:11:04 +0200 (CEST)
Received: from localhost ([::1]:38190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZDUs-00069c-Q8
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 11:11:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nZDN0-0002aX-Fs
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 11:02:54 -0400
Received: from [2a00:1450:4864:20::52f] (port=43771
 helo=mail-ed1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nZDMv-0003vg-Fx
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 11:02:54 -0400
Received: by mail-ed1-x52f.google.com with SMTP id b24so21023910edu.10
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 08:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=cVvM6ObxdSiQS5p632Vjdts5EQffaPC0BoIqoTrkfncgVUHtAyidU181mtMUWT5ihq
 WjQB8Pf7y/UFmf6ntDoh1w4i1pR2TYpnvzpDNErwtuuPpmc/jWz11U0RtqgP8ZTtQWDq
 ynxecn0WSKaCbEtySDfRiqHspe/nOXAnyt06UwXaY/8IPUvFPyJTsp0QYOYKsBgfpsV5
 3RWFIaRtlE0nTGqnf2sJHQU3P9prrwSpkr9xp7M8mHptcHfQg9IFrqAUc+IytW53po1M
 xm9gPznHLxb4B4xBxOuKHRI5wbaD2Guot3WskVQwgq7BMDu6wBmIeey4vAZ905f8QpMy
 1Pwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=idQzmuldn167cO2fEljQcyDO9+PjlogPRcGc+LuA9ioYaLH1viKw7FHa8fJPNgp6fD
 tVS3IzQVO5rSNqXsvEKxLvDDQc1YkEgCRl0HC5RrkDSShBALQo/i0cDCye6IRs/zXbOd
 Gzv41AgbSt1UBRkOEA4tqhU28lfqJfnZ97/GkHBj8hq71Mm4fCpdDWEXJeAoujwRvp+Y
 xt45MNW4jg63RZ7USMa8nnABWboVle7Iz+2388oVN5hD2TCtlD3I0xA9YQsKRnPSen9J
 9HbEVWC80KJY7AnQsmadE5mx3fYJoQ/yXM6U04aBfn3NFTlFacqckLWDVgJnwHCpElNh
 faWQ==
X-Gm-Message-State: AOAM533tpuYHx01/m1V6QycXpdh1XRmGUGPEAiFviLkH4nMY5qrtvK41
 nW9W2xH5t5ZdUHcyT4noo0A=
X-Google-Smtp-Source: ABdhPJxz8MtRk7buxATdYEhCv32HtLbYDqEHP4lDDOIW3Cv8uGFGIaX+DC7nLkkksNE9/9drc4L+kQ==
X-Received: by 2002:a50:9fa5:0:b0:418:e7c4:cf96 with SMTP id
 c34-20020a509fa5000000b00418e7c4cf96mr5087483edf.30.1648566167826; 
 Tue, 29 Mar 2022 08:02:47 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:8ca6:a836:a237:fed1])
 by smtp.gmail.com with ESMTPSA id
 q15-20020a1709060e4f00b006cdf4535cf2sm7144778eji.67.2022.03.29.08.02.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 08:02:47 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Dov Murik <dovmurik@linux.ibm.com>
Subject: Re: [PATCH v3] docs/system/i386: Add measurement calculation details
 to amd-memory-encryption
Date: Tue, 29 Mar 2022 17:02:29 +0200
Message-Id: <20220329150229.878490-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220217110059.2320497-1-dovmurik@linux.ibm.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52f.google.com
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eric Blake <eblake@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Queued, thanks.

Paolo



