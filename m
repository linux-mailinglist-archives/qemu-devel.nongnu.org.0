Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAC053159D
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 20:57:00 +0200 (CEST)
Received: from localhost ([::1]:44858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntDEg-0007EX-Fb
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 14:56:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ntDCc-0006FY-5m
 for qemu-devel@nongnu.org; Mon, 23 May 2022 14:54:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ntDCX-000473-4V
 for qemu-devel@nongnu.org; Mon, 23 May 2022 14:54:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653332083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=i3hHDnFgpxOQDAvsu14JTnhosmqnWvom8AdrYqmxcqRo0KmgOHoYw5SVdbrSdW4tZJY0Rs
 a1/Koxuc+B94X4Dqcd0mEPdd4vItM3RRIqBQTHLAUN5BAMc429jCY7Yp3adpdYHeOCX1FV
 c/9QTNyYhffF8BbDcsiDijC+TQLoCAk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-327-JX3QRBpQPhuxNhKeFtx54A-1; Mon, 23 May 2022 14:54:40 -0400
X-MC-Unique: JX3QRBpQPhuxNhKeFtx54A-1
Received: by mail-ed1-f72.google.com with SMTP id
 w23-20020aa7da57000000b0042acd76347bso11188393eds.2
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 11:54:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=etNT2FobLPU6YnrCN8n612pAWHgkmBxs4w9//8Chpqh0nAj8sF9tE6iEHnaJhhOnwZ
 WGUWuz/UH2C7+geZ+ccczoXQIh1yMEaIfg0WlZMAA8Dl3rJnTYl3ySVjgU1DL0eOW3y4
 vMP9sKVX8cFSCNh9nj7F53Sm8h2IBLS9ZtSOT0w26gaFaIXvEfVXh1hKKOz1Oupu5qFB
 rxg7OlyDuvioUfJXrCV1yy16Bk5BhpBxV6jkGxW+UDLrqgejk3kUozp1PONciSl/t+sw
 2+TR+AdONURNOUUB11QplIQW/XV9CsFhS7rjRB0mO6YKI7VTM6A0oOIw/rUh8oQB2Guq
 3uqw==
X-Gm-Message-State: AOAM531Hhu62ecWoBX4s89FLDw30QY7laUuInDTMPnJeW2L/BuAJ4gyx
 sjzXXU8mXwHa5hNZs6jgObFVhwOTQzays8TI2sAQ9TNyD9LiyE4zSlaLT7nD+dBFW7tRLLGrZGw
 wMTVvJMLsTKv8wM0=
X-Received: by 2002:a50:fd95:0:b0:42a:b7ba:291a with SMTP id
 o21-20020a50fd95000000b0042ab7ba291amr25054012edt.247.1653332079451; 
 Mon, 23 May 2022 11:54:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzlP4vFpiuwfDgCgLY+SMHgDrnRZVTVsHalTH3Umr5xRZAxRyaflx9PhmieSCKcv6MGdUosqw==
X-Received: by 2002:a50:fd95:0:b0:42a:b7ba:291a with SMTP id
 o21-20020a50fd95000000b0042ab7ba291amr25053997edt.247.1653332079232; 
 Mon, 23 May 2022 11:54:39 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 kl4-20020a170907994400b006feb6438264sm3645800ejc.93.2022.05.23.11.54.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 11:54:38 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>
Cc: Marcelo Tosatti <mtosatti@redhat.com>, kvm@vger.kernel.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2] target/i386/kvm: Fix disabling MPX on "-cpu host" with
 MPX-capable host
Date: Mon, 23 May 2022 20:54:37 +0200
Message-Id: <20220523185437.364606-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <51aa2125c76363204cc23c27165e778097c33f0b.1653323077.git.maciej.szmigiero@oracle.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Queued, thanks.

Paolo



