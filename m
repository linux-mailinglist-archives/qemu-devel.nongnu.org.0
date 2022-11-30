Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE6D63D738
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 14:52:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0NVg-0002un-Py; Wed, 30 Nov 2022 08:52:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p0NVV-0002sO-RC
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 08:52:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p0NVN-0003P9-CZ
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 08:52:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669816323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=YwDbPmYnJq0LIYZvQMhtxVNDGv6rKQ9HVKplT3UWzAY/BpWO1V/iWhHOWLBR12NLENyUu2
 9YuPuBxxHVtW9+fEf+fSADlbbdiAEVQ7G14r5l7xFrEaDTCVH//5zh4XrDYbeH3y5fTYBs
 GN51WjeYO+s1i5aTdH5c8Waz+4abS/s=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-341-ExLe2MRrPo2XUHncXLa4sg-1; Wed, 30 Nov 2022 08:52:01 -0500
X-MC-Unique: ExLe2MRrPo2XUHncXLa4sg-1
Received: by mail-ej1-f69.google.com with SMTP id
 qk16-20020a1709077f9000b007c080a6b4ddso4381716ejc.18
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 05:52:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=yIARCIp4OrQkK8IMWpGRLqfMGObuUfQOExgVsGrdQ5zdRrFnbsVDGr4z9KzbHmgNcu
 vpBSL2g63aQDoVVOwaoKPOPUoqtnzw9gOKo7PFrAK3jTx8b8AJRltCjeyvdpKCGtkOff
 XoLhmHAVD0BH/rwHn35BQWDOyhOT0dsxhb5qag37tcHuUASAqAjXmWMZw1VW3PGAAHc7
 YJbKZ4zsIx6Z4U/Dbou8JXZKT8hZqAbeixyuhK1RKdaV/I0605ShFsewgAuJYa4FUlxi
 R/emDUsJYkpvRl4c38I3mpB5ksWyKeBCdWff4uGDMmKwkt4em6Qknoduk1KXLWJUxljY
 h5rw==
X-Gm-Message-State: ANoB5pmbTnnXYK5s/l8uB/rtm+1j6ka2RdwrMsURc8D9yruulK3SgzxJ
 wSS6u0nkfYqaRdzxVKEmMS8J/GcW4fCGMJWe/7bwnuWbyALUpfVq6JVggdEyhiun6b24rWEIHbq
 orMAevrjsi9RtRM8=
X-Received: by 2002:a05:6402:2b87:b0:45b:c731:b683 with SMTP id
 fj7-20020a0564022b8700b0045bc731b683mr57825035edb.251.1669816320738; 
 Wed, 30 Nov 2022 05:52:00 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7btBrGGd5q2AgLNbdLGElK29A7zE/WbHLnu0K0p7Hkk9tzMD4riAmMfYlaoiSMbSaQ64EAXw==
X-Received: by 2002:a05:6402:2b87:b0:45b:c731:b683 with SMTP id
 fj7-20020a0564022b8700b0045bc731b683mr57825016edb.251.1669816320419; 
 Wed, 30 Nov 2022 05:52:00 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:4783:a68:c1ee:15c5])
 by smtp.gmail.com with ESMTPSA id
 gh22-20020a170906e09600b007bd7178d311sm677032ejb.51.2022.11.30.05.51.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Nov 2022 05:51:59 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Lubomir Rintel <lkundrak@v3.sk>
Cc: John Snow <jsnow@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [RESEND PATCH] ide: Add 8-bit data mode
Date: Wed, 30 Nov 2022 14:51:52 +0100
Message-Id: <20221130135152.16962-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221130120238.706717-1-lkundrak@v3.sk>
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


