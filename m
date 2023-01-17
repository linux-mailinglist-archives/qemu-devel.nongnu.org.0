Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFBD66D79F
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 09:10:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHh37-0006LG-SB; Tue, 17 Jan 2023 03:10:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pHh2e-0006G0-Gc
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 03:10:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pHh2c-0000af-QU
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 03:09:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673942997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=hXPVXcBnGRAjp+XcsmQRSOEdSZucdXstsyfN/EQ6DmRmiG1v3wJUAevBxTU09lGexpMYvk
 4css/h5Tmvp7rwmKiLklfRe/bmpssB+Lbu/ZIuM/I2KKtjoJ0wLVk5xryI1Ei+l3cZCDAK
 +ebJa08rdzLjrO47NXw45e/Nxj6JgmA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-503-qVxqUtj7NGiXIWHo2KGI0Q-1; Tue, 17 Jan 2023 03:09:55 -0500
X-MC-Unique: qVxqUtj7NGiXIWHo2KGI0Q-1
Received: by mail-ed1-f71.google.com with SMTP id
 z20-20020a05640240d400b0049e1b5f6175so2964822edb.8
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 00:09:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=vrSExlrPjU/G9wYPIM+NvvveDqfIPP7xrZP6e1FahjxFNQrxQTHUG3fBWKEKEr4YH4
 RD2OVfqvfKhcivPhu6fLo9/O2saf8nJqWYAwQY8UN+2A0keArJnmWVuSe4eT6BCgpdIj
 O6GPg0WlhYUPZVq9YBmMYE1sWUpZnX8e4HAaK1pgclgyqEo2drtp9k2YkmfQDCLWloIx
 Q1Rzi15NCFItQbgo5UfQ3tcSYVrarMWhAKDR9E/xwOJtlRX2AZ+lZw4S8yJiNFqnXH/5
 h63l4FfBPO5vD+RLm08sYSidCyAeJsCudNaksSc3FZ7IYGanxH0cboqLjksyWFDF5y6y
 v1JA==
X-Gm-Message-State: AFqh2kqwSBjZhlR0172wUc+SkLL0mRWdFmuw1NNOyE5p1IjJGGgwkqC4
 6d8Kyd6OrvinN2+6rwXTcIP7sWpjrf5+MtameYSjiCFLM7C4h0DtsS/14Z2RI+GRaaDCDRHpZwv
 faIoj3Rh3da6gkfg=
X-Received: by 2002:a17:907:8b95:b0:84c:eca0:5f67 with SMTP id
 tb21-20020a1709078b9500b0084ceca05f67mr16840908ejc.54.1673942994107; 
 Tue, 17 Jan 2023 00:09:54 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuqQmpcA3a/7lvZzmSjE7gelhbx/FEeMEagPRJSEtYbtQyksl6ecUQEEYzOFhtTI61MXDQawA==
X-Received: by 2002:a17:907:8b95:b0:84c:eca0:5f67 with SMTP id
 tb21-20020a1709078b9500b0084ceca05f67mr16840896ejc.54.1673942993911; 
 Tue, 17 Jan 2023 00:09:53 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 gj19-20020a170907741300b0085e05b4f815sm7611026ejc.95.2023.01.17.00.09.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 00:09:53 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org,
	pbonzini@redhat.com
Subject: Re: [PATCH 0/2] target/i386: Fix BEXTR instruction [#1372]
Date: Tue, 17 Jan 2023 09:09:28 +0100
Message-Id: <20230117080928.43419-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230114230542.3116013-1-richard.henderson@linaro.org>
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


