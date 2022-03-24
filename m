Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 478744E681D
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 18:53:59 +0100 (CET)
Received: from localhost ([::1]:44688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXReo-0003w6-4N
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 13:53:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nXRVW-0000WV-27
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 13:44:22 -0400
Received: from [2a00:1450:4864:20::52e] (port=44791
 helo=mail-ed1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nXRVU-0004GF-JP
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 13:44:21 -0400
Received: by mail-ed1-x52e.google.com with SMTP id w25so6469533edi.11
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 10:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=nNvYDzB3U0aWjom8ijzuddT82GeZydSx7uuT0XcQE+jiGHuxicRTXleJthKc8/yzr1
 T5kzweUb2TNyTdTE7o5hFTgXMaTxD11gA6vU3fHXLvYSogjkep2D6g8v9cZIgwcgSSub
 nb+UQregk/+B2jIqfbxUfiZXsOrWGm/M+E196kr/dhCXUZjb85ikUFkAYJkuwXHv32yb
 xlxEBxOwPW3KmRo70C8tYpJPPx+LO8Q0ruRyu1taO1IntTfRu9WUpP+wr3Um4gooSRue
 pIUXpX71QiVve5yGErhGve+fQeAJ1SBGrC96jKL7r//oNamkWEuLFW+lpTk/MSVHKEtA
 AD1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=0weZo9N+875AIpHZZKrbOoVkXgR1mrCUuY9S5TcFDgieKgISI1U0SjMepPpa5LO4HT
 WcG8+WSaH+LTP+iVKN1C8PlWDnP6TFThqc9l7u6tfChotdhjTQHwRbCua0IA2h/fwj9G
 b2MW1186iIuc8DZgQDeAFrbnTBspobKJWJ+iykjo3rW8nb+ehywRKqAFWISu3rcBt2vQ
 buDm0kEM+qLUPaKhagZlQmgD0EJ0HYwu4jjoOL3PfLXizNR4noZV2y16ZvuPkJch+ahC
 vDgx13eLCLgj3matW02UiLrAHO9HPuS83l0+1R43HcWWD1URv2M5PPAAdaLlqXHoqV8X
 r/Mg==
X-Gm-Message-State: AOAM530r5QsGzBlhvc+8nt4ECW8ouevVxl4XX0cErNVp5s/dmqVaMJID
 GWfm2GJJzBQBTCquPzLw+Qg=
X-Google-Smtp-Source: ABdhPJz4ZVU3E4ByMUtoHvGd8VX83eXmF70UA9uDnuHA1KxFM5/NVYqIiLLN71v7ktrC4/868s8pcA==
X-Received: by 2002:a05:6402:909:b0:415:cdbf:4748 with SMTP id
 g9-20020a056402090900b00415cdbf4748mr7919740edz.395.1648143858796; 
 Thu, 24 Mar 2022 10:44:18 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 r16-20020a056402019000b00418ed60c332sm1720820edv.65.2022.03.24.10.44.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Mar 2022 10:44:18 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: christian.ehrhardt@canonical.com
Subject: Re: [PATCH] build: disable fcf-protection on -march=486 -m16
Date: Thu, 24 Mar 2022 18:44:13 +0100
Message-Id: <20220324174413.224219-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220323090713.1002588-1-christian.ehrhardt@canonical.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52e.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Queued, thanks.

Paolo



