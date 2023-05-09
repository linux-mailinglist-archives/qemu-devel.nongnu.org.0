Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9616FC25D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 11:07:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwJI3-0006Fl-BD; Tue, 09 May 2023 05:05:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwJI0-0006AR-6E
 for qemu-devel@nongnu.org; Tue, 09 May 2023 05:05:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwJHx-000561-Va
 for qemu-devel@nongnu.org; Tue, 09 May 2023 05:05:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683623141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=cjZgwt4ku+HzflXDVldmYBVQc7m2MMLNJ/tBo1Hh6RaIqKRQPIjHG8+L/qXrLMaXugjjWj
 /1koeF8fucxDQ+YIdNxclEeXYQIf5/txo0vlPlvPJFJhHsE8YIdLkXyBgoTAOhbl8dPkbm
 fbMdsDw8PArc3yW5jzQH+jfSKFzHXLA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-341-9V9LXM4wO4yjigeF6S-P-A-1; Tue, 09 May 2023 05:05:40 -0400
X-MC-Unique: 9V9LXM4wO4yjigeF6S-P-A-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-95f6f291b9aso690713066b.3
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 02:05:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683623139; x=1686215139;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=cPs/ywPxYoxtARp7PrRqD0he31qlcJ6OldGSTZH4vfdYMVEI0jSHzoQPJ84oEundVY
 9pQPIuEdxzQGbytCs2zNP6FtFhFZ32WTQ4b6elMy5D/+Sv5tj7V6/ZsP1Ar/c8ACyXWU
 fhPe67LTYCCxTATogOAuk/YeDKGH3/M9Imy43WdunwJcxlNmzW1NW122XZip93P1k1Bn
 hQ1lRu3AXKIwpj7q1yKE1XwuRJwu9UjeQmY3WpHbTo4/IOfe82FvQvBBW+dDIg2/GLL+
 f9TEQnbhgr0AHgSYGbghib1lXRPUyZ+oNFxyNou4KtcExq8gF8LwqxjebFJVNGlp+pFp
 H/EQ==
X-Gm-Message-State: AC+VfDzi17h9+BT4iTQSVMNNnLpeNr972OUdovNQn9ZlY+3q7HxuckMk
 P3Z3/ZlUoUeyep3LDWwp8wFHJJ+JHYkGF2t1uz/Rcc09YauJLdeoq+HcuB2AgCWrPWDoDIzdP0+
 r8bhlpuju0Q2xV6I=
X-Received: by 2002:a17:907:3205:b0:94e:8559:b5c5 with SMTP id
 xg5-20020a170907320500b0094e8559b5c5mr10221708ejb.64.1683623139152; 
 Tue, 09 May 2023 02:05:39 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7yoxWuCK06HM5s9ZTDrYU6Si3TzdRQJr6ucfnBYY6H4glNlyCoTdC9haBrszEv6VLcY+KmIw==
X-Received: by 2002:a17:907:3205:b0:94e:8559:b5c5 with SMTP id
 xg5-20020a170907320500b0094e8559b5c5mr10221700ejb.64.1683623138943; 
 Tue, 09 May 2023 02:05:38 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a170906609000b00965b2d3968csm1049501ejj.84.2023.05.09.02.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 02:05:38 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Maxim Levitsky <mlevitsk@redhat.com>,
 Yang Zhong <yang.zhong@linux.intel.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Jing Liu <jing2.liu@intel.com>
Subject: Re: [PATCH 0/2] target/i386: add support for cpu FLUSH_L1D feature
 and FB_CLEAR capability
Date: Tue,  9 May 2023 11:05:37 +0200
Message-Id: <20230509090537.38568-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230201135759.555607-1-eesposit@redhat.com>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Queued, thanks.

Paolo


