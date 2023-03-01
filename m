Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1696A6AE8
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 11:38:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXJpx-0001On-G3; Wed, 01 Mar 2023 05:37:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXJpl-0001OL-F4
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 05:37:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXJpk-0002nm-4Q
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 05:37:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677667034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=aogM33uHLR/+otLW7Q4nDdLDmayz9GgNoUqhdsOdfPyM4w7EPGjVqcEeEis4WdzTkiNQJL
 f9UI3PoaXoaOIQLCjKEMvsdQBV9pcfUQebaR8WVdBT8G1dtT/Ykne86Qg9HmIhgBKFbZ/E
 aswdR/9PzMNTRbI75Ow9phwW/Tcv07Q=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-145-zGnNDhJQMd2TtrCdJjaSdg-1; Wed, 01 Mar 2023 05:37:13 -0500
X-MC-Unique: zGnNDhJQMd2TtrCdJjaSdg-1
Received: by mail-wr1-f72.google.com with SMTP id
 o15-20020a05600002cf00b002c54a27803cso2450847wry.22
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 02:37:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=k4wGWcYXWg+L0OrugCFblxhMJGd3n7ajb6Oa24nvK1p7ona352sTQXDxYfEY4PYVH5
 bAG7dHJKRlbNsUOnosJDPNaMjj8JcKMdXFEi+rg6jq9POnogbtgwzKHR4M6YH9lA/QFv
 WUxqesLH52yUacowu6jd4AQgbukXOzpTy8UqlnLgGq0xZ0A3LLIlJX4I4HYqtQtSu2+W
 yZ9W8nYFcJWkk5SWYV6taadtTsN4uRpLMPwCzjPgqq+vY46zNC6RLXSBe55mzu/9bD0J
 UGXWZtfQUfkAYOGbZKgnZi2Fl+MQRIIGdzm5EIzkXqf24C/ivoAhcJ12eZmIgeLmUwbE
 6cMQ==
X-Gm-Message-State: AO0yUKWomCpXsakxvFx7C6DdrLsdtR+Kz1xhae4j0yU/0Ign+faCYdx8
 e3yEqJL+KFIjYNFniCiuKYfh8bQ45wZP4x8ZyCvPaFUp0j+oMdF4DSrn+8/P/oWMbagmEWvBumI
 ftnwqaM3J46St61RildRF
X-Received: by 2002:a05:600c:b8c:b0:3e2:2057:b9d6 with SMTP id
 fl12-20020a05600c0b8c00b003e22057b9d6mr11269099wmb.20.1677667031656; 
 Wed, 01 Mar 2023 02:37:11 -0800 (PST)
X-Google-Smtp-Source: AK7set99cNVxWg94HNl08JcKHRk4uyJiFqneFeCtGHaRI8EFeCS32fRL6LKn5HPJLuQIz/OBTTmI+g==
X-Received: by 2002:a05:600c:b8c:b0:3e2:2057:b9d6 with SMTP id
 fl12-20020a05600c0b8c00b003e22057b9d6mr11269085wmb.20.1677667031380; 
 Wed, 01 Mar 2023 02:37:11 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 bd12-20020a05600c1f0c00b003e0015c8618sm18960210wmb.6.2023.03.01.02.37.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 02:37:10 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Peter Krempa <pkrempa@redhat.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2] qapi: Add 'acpi' field to 'query-machines' output
Date: Wed,  1 Mar 2023 11:37:06 +0100
Message-Id: <20230301103707.20586-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <537625d3e25d345052322c42ca19812b98b4f49a.1677571792.git.pkrempa@redhat.com>
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


