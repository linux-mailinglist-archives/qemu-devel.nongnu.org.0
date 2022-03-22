Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EDE4E43FD
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 17:14:09 +0100 (CET)
Received: from localhost ([::1]:48632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWh96-0005N0-CL
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 12:14:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nWh74-0004HO-Nw
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 12:12:02 -0400
Received: from [2a00:1450:4864:20::42c] (port=34601
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nWh6x-0005Yz-14
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 12:12:00 -0400
Received: by mail-wr1-x42c.google.com with SMTP id m30so14279171wrb.1
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 09:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=NkUM/U0D3JQUxbDA0GNXJr81JNXeEBFHHY9Bfm+t3hhkkLzmmtwo0FQJWhea/ytF1C
 ZVZ1jIDq+WIRgnMEvXoNYYGdLlmqimlkims4Z9dAD5WgB4ti61Jv4KhW99JSTYC2kHnH
 Eep24qBdroP0Z+h5W6t8RsnoMxlDE+Uot4LJBsAx6aRnGJLRn1B8yEYnDn3CSsGvaVXD
 7brfLJYEdU3VFxAw2l6IG9JX7fF89ZrMT5nlsh9IC5Pv/QejaFLUwtwVoAhs0wchi5uh
 0fYidLXB9zZMSKd88npdRgeDUoMRpGVw6WeFPCac48dXDL75cfJ+s3nPVbxv6sIIRtqK
 D8+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=NWdMCmOKNt7HdCGJYjmojGFl9UKydK4Ai5eLqK53DZyzyZX4h9U57O8mQPmOQgb2/n
 swW+XEtGR4SKgZ8qBPRTOJVYBndeleiR09B8lrbyM0xPlpQf1iCK5Vf1gwsMhKB/6gbs
 Tuw9sz7i/iprcY4G9nAXQQsSU7itxlMJKt8Jdu1sL0IYxdRB/IPYoM58WyrsHo5c09+r
 HDgqq3FIeQ6TwlklXdo5gb/WE0Afx/uf4cIX3vDcF2Dq4/JGmv2EAwG2MlZc6bqiut8r
 puvdteaIV3opFLdAeO60TXFDXst9wIJ64HffiOUe0fveh9IsVOp3pSzqrBTeRYTRON2a
 IXuw==
X-Gm-Message-State: AOAM532HkSaPXUmps/MHly/hg+Fxy+p+Sp2YRQrnQC/QiwOakpAnL027
 3LlRN5f3HIvaHIbac7X9qs0=
X-Google-Smtp-Source: ABdhPJymWmXuECdO6We7BmwgG//r/VphLDizJaovvwQIdsSLyWnL8llg+G2pPkWGSD9zmK4zIbmpow==
X-Received: by 2002:adf:9794:0:b0:203:e074:1497 with SMTP id
 s20-20020adf9794000000b00203e0741497mr23704121wrb.75.1647965512254; 
 Tue, 22 Mar 2022 09:11:52 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 f8-20020a5d6648000000b00203e64e3637sm13850298wrw.89.2022.03.22.09.11.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 09:11:50 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [RFC PATCH-for-7.0 v4] target/i386/kvm: Free xsave_buf when
 destroying vCPU
Date: Tue, 22 Mar 2022 17:11:45 +0100
Message-Id: <20220322161146.261513-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220322120522.26200-1-philippe.mathieu.daude@gmail.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42c.google.com
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
Cc: Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 kvm@vger.kernel.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Queued, thanks.

Paolo



