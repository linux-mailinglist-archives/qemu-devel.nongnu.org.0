Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 968BA6D96BD
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 14:06:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkOMg-0000IS-R7; Thu, 06 Apr 2023 08:05:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pkOMb-0000HC-JB
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 08:05:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pkOMa-0004Vm-4d
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 08:05:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680782710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=ATxQXCSV/+QsS859eqHKCSQ2oSORzCEA3J6aXwAR04b9lKxV1xUTtWSufS9PgPFDUydLbB
 BCBku2dWWcb4vKYD1bFTOgTmZ7f37pKlq4SZNMao9Uz15BaEeiYfU1liSF8JnYJ9KRIEl9
 Jn6G0Nu2TCJ2LufpQTWkf3MS/fE280U=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-c2Z5OKGrO-OHgNoGtA6_BQ-1; Thu, 06 Apr 2023 08:05:09 -0400
X-MC-Unique: c2Z5OKGrO-OHgNoGtA6_BQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-502a69a6ec3so838520a12.2
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 05:05:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680782708; x=1683374708;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=TAvag7ycndZNbRIJ7tJO9/URdVoe1uEldPJArjUajn1oJmsty9S5P9LeqGYSVvaltF
 7MuDjrREVUYqdPsufESv7OfuPJ8XEYIA8n+grvaNZcD+vlhjR3ijaCnwkxLtDuy16cOT
 PvQxOlmU5+S/l570yzLUXZEDCcoOVnNJtFbUqFa5sZK6Do/dB44j7p3TOtJFOZwV2O6D
 PuptUp/Zz5/Vj8stMDYexx/PJCN2jxVyRPzHc8HJs+wJOOn3G56UqekRp1Qs6tpnlKvo
 s7vGWK2PzN8/B/eci4I7n/+n1kWmD1LxFZ6OmmMauFH4UNTKZoiS3ScYyHKFl6YrkB1T
 N+FA==
X-Gm-Message-State: AAQBX9fNVq2zC5h1D28uIDWghzNnaR/HrKOODLsUnO17qsd7jlLyGJID
 Lo/gf6YLsML8TvovpWGgssS3EYaCrB2riSc3Fgpmx9euwsPPaVf342gQF448cKMxP7PSlKtBPzF
 n4aSW5P94X2uvNLk=
X-Received: by 2002:aa7:c602:0:b0:4fb:279b:b38 with SMTP id
 h2-20020aa7c602000000b004fb279b0b38mr4085451edq.33.1680782708640; 
 Thu, 06 Apr 2023 05:05:08 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y0hADT/udsKW0ZRekuFl82CULxVhp+6Z+ccKG5Pj/z5ITgfccRtXPPeS7jv2XEkFZUJjZLXg==
X-Received: by 2002:aa7:c602:0:b0:4fb:279b:b38 with SMTP id
 h2-20020aa7c602000000b004fb279b0b38mr4085429edq.33.1680782708297; 
 Thu, 06 Apr 2023 05:05:08 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 u3-20020a509503000000b004af720b855fsm662360eda.82.2023.04.06.05.05.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 05:05:07 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Yang Zhong <yang.zhong@linux.intel.com>
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, seanjc@google.com,
 christian.ehrhardt@canonical.com, kai.huang@intel.com,
 weijiang.yang@intel.com
Subject: Re: [PATCH v3] target/i386: Change wrong XFRM value
Date: Thu,  6 Apr 2023 14:05:06 +0200
Message-Id: <20230406120506.251454-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406064041.420039-1-yang.zhong@linux.intel.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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


