Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 706446F8A92
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 23:15:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pv2ka-0005x8-BC; Fri, 05 May 2023 17:14:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <turnjam933@gmail.com>)
 id 1puz6X-0003Ac-QE
 for qemu-devel@nongnu.org; Fri, 05 May 2023 13:20:29 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <turnjam933@gmail.com>)
 id 1puz6W-00021r-Cw
 for qemu-devel@nongnu.org; Fri, 05 May 2023 13:20:25 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-24e1b9bf758so304005a91.1
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 10:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683307222; x=1685899222;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=7AS5I9EYQMJv5shOZJ052cJilivdmE/42yHamIFjS8U=;
 b=dG6eVWrRRigfh+vos/jPitQ+FyYyfyL4RyGMxwVhV1hePrfVj+41+pEStW5VbBVUKi
 8G+bXGypLvIh/LKIXBQFA+tlshlAribUPmKmDJjDyH2ahqFrPOudBByla9tPlMqJ2fQR
 2R4zSdCJCTUubC0oxsx9sjFGuXF0RBuVlcyrK4T+uLS9QuEWMbfH9TBOa1EJ4R+Hkvq1
 4veLn0PSSGIoGUb73Ako6rFwLGTypGV6YsKLSoQ+jbSJ+M8HDy8aNl8z6b3H6RVPHywF
 ESgeI9DKaEj4y/11E2PWdAIEoT8MyagG5oPRjnyxqWRYvkaB4C3bZZiP+Az6mzWLArGC
 hmaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683307222; x=1685899222;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7AS5I9EYQMJv5shOZJ052cJilivdmE/42yHamIFjS8U=;
 b=LQjHU4CJOMNG4X2pulSZEYWq/VqPghgoKv6Xitdjoxj+ZVuNhpvSQIxKwiV4cSTFws
 RmNOvbojHD3U56k6cne20jVvmbXWHfm+dhMM2U7/Cufi5WTvSfqfoogYpta6E+LuClqb
 SKsV22NTRrYbuJXj0XLIOoBSmvJHg9BtjP+rLny5NIWtFMNN5VWxCCJl3MdDC/oBeIz1
 cGXiaQWiSYJLapvk5fyHg4AoqPQA/rSYm5i/J2E1tgZGNe9HmYhAjxC1XQDdQBrouPGx
 ke3HyscHmcDciXS4SBLUpGseNrRKLqMPFmwyyH5WnZJA07plTCoVUpDLxwnmu48QECt3
 ufMA==
X-Gm-Message-State: AC+VfDxhOg2RaTVsOnJugStV2E87+R4DewT+dvuwSf2M47LlOGD3hZrF
 sais/cSbUd17oR9x5vb/IYOvcd+xc/eMY4ZtFm4=
X-Google-Smtp-Source: ACHHUZ5c3zfbbE2IgIFk5Dq+fnqZRjH1Iru0Z5nFswywvKGih/oCZSQI2VqO3Ob+u1eyCrkQv98hZUjWfxHx7qbGc3U=
X-Received: by 2002:a17:90a:19d0:b0:24b:efc9:44d7 with SMTP id
 16-20020a17090a19d000b0024befc944d7mr1923876pjj.0.1683307221878; Fri, 05 May
 2023 10:20:21 -0700 (PDT)
MIME-Version: 1.0
From: Jamie Turner <turnjam933@gmail.com>
Date: Fri, 5 May 2023 12:20:08 -0500
Message-ID: <CACMrbtuv5rF3bVS=K-3oZLuu_+XfwM-Lk0Kj-bbcOnNuuGd6rA@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v4 21/24] target-sparc: Use explicit writes
 to cpu_fsr
To: rth@twiddle.net
Cc: mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000020d0805faf5813a"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=turnjam933@gmail.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: 19
X-Spam_score: 1.9
X-Spam_bar: +
X-Spam_report: (1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, EMPTY_MESSAGE=2.32,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 PYZOR_CHECK=1.392, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 05 May 2023 17:13:58 -0400
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

--000000000000020d0805faf5813a
Content-Type: text/plain; charset="UTF-8"



--000000000000020d0805faf5813a
Content-Type: text/html; charset="UTF-8"

<div dir="auto"></div>

--000000000000020d0805faf5813a--

