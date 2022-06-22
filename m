Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABA65542E8
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 08:26:21 +0200 (CEST)
Received: from localhost ([::1]:33178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3toi-0005Sj-DU
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 02:26:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o3tm3-0003Ul-D1
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 02:23:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o3tm0-0004sh-4P
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 02:23:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655879011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=fThciXhV6ymKCXN+FC1PcC+zGmHXN08SvJd9nflm7KYAkE0FpHQoO5nSdLVbmd8pKGUfZQ
 27Jx2pdaERS7KfRt8Q+efY9ONQ+3AS6rucwDgaTetpkI/kS+PjaQ4Dl6eXwpYtm2NaRf9t
 +4OVAnEuZPOamBx5OWWiUTWWSB+1r6E=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-640-8BvyejIwMOabh_UFcXh4og-1; Wed, 22 Jun 2022 02:23:29 -0400
X-MC-Unique: 8BvyejIwMOabh_UFcXh4og-1
Received: by mail-ej1-f70.google.com with SMTP id
 h16-20020a1709070b1000b00713a3941a27so5815124ejl.0
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 23:23:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=z88aTMlUALAyB5qp7HS2oxPRLZ4Hux5kKCJ9YLjP2DYL0iKC+Rw9MIVgCrs7eLFlKD
 dVXRrz/unCRiv9wLU/JsnWDfqp/Eou1v+ZS4ZenfCKmanSOjBEMuUJh6DtbVj6hkbd9T
 rKfcMNkbVe3+75phGfUOfp+eZ9nBovqxFBKy6bwe9GDrAJHHyY1PS7xzomDW81u4AbAL
 wuEaeYAMBr/nbprF65FyVJVNiAciyVTODIrxmr86QWKSzWZe1MexQn5FQDQo4d7V7hKR
 y182xAt+xmxf5ns0WqmPdkHWVa0g3Gw8aHtCq+Ib6PcAFtE9SZSFiUSorcnDg1beustP
 z+SA==
X-Gm-Message-State: AJIora9wXf1rZ1jQGLHRrW0vl+gt5yAe/hi3hgC+Q922rT7vNahxJe3R
 6sgTA1KuHKPUcI3aF6qDQZfJXMfJC2ceXdsDgMbsF7xM6NLhBKuchVvW3mC0xQwoJIiGtZyAo6H
 E1lyCy51fdqNzYQ4=
X-Received: by 2002:a17:906:478e:b0:722:f84d:159f with SMTP id
 cw14-20020a170906478e00b00722f84d159fmr153501ejc.182.1655879008683; 
 Tue, 21 Jun 2022 23:23:28 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uNRGQ+Kn9uydptb9aj7AcjsBO4uaDn8XrkZyHSUXkuSGNiGzXO84jNGVh478x9J83UOuF9wg==
X-Received: by 2002:a17:906:478e:b0:722:f84d:159f with SMTP id
 cw14-20020a170906478e00b00722f84d159fmr153496ejc.182.1655879008494; 
 Tue, 21 Jun 2022 23:23:28 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 cm28-20020a0564020c9c00b0043577da51f1sm8133299edb.81.2022.06.21.23.23.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 23:23:27 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Alexander Bulekov <alxndr@bu.edu>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] build: improve -fsanitize-coverage-allowlist check
Date: Wed, 22 Jun 2022 08:23:26 +0200
Message-Id: <20220622062326.94626-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220621204507.698711-1-alxndr@bu.edu>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 TVD_SPACE_RATIO=0.001,
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



