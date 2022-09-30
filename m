Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A591C5F0786
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 11:25:03 +0200 (CEST)
Received: from localhost ([::1]:60566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeCGT-0002lQ-GA
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 05:25:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oeC4r-0007lf-KV
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 05:13:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oeC4o-00044T-Sq
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 05:13:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664529178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yfJSblJd3isgstycg1zgisFVnRpGSe0JABYToTKmEMY=;
 b=XV339si35fZH1/3EXb4YLlv9EsPLNc6fjPcmU/GbnDhvyq+ZQ+oTNeTZOkeoSysnalP8E9
 dSxWhSXnuktvW7VdZ0i5W1WNVmPhJ3tlnSuIJrQo8Gh+YWpzL3kvPgz98BakbkLD+Wqjkn
 zVz1gfc13AtxV2aaYPJN1dXlHfJKQMc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-402-S7UqnnWGOZG-J9d6P6G8LQ-1; Fri, 30 Sep 2022 05:12:56 -0400
X-MC-Unique: S7UqnnWGOZG-J9d6P6G8LQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 r11-20020a05640251cb00b004516feb8c09so3163628edd.10
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 02:12:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=yfJSblJd3isgstycg1zgisFVnRpGSe0JABYToTKmEMY=;
 b=IVZXrTBVXXnH/KYEkZU8dD3gpFLMC6QW2BFm4hhzAeTm8ukf/wLXEcdlUOM+jXPZB2
 cEVpnJG7wBaqBmgBFHXir5SNLt8z9qyCbLcvXsccwaDcAjgaioCAjuWan/IDnd4iqwmx
 fJChe9V5B4kgOZQVsenWYhDSfv6LF6Ew5aiWeaAhXp9m7EJ97XWXhtV9WmQDCBfsEOw+
 hUaZsR1zT7IGOlZSnp6vHacNWKG5L/LJIwKEI7OCupLo01ncY3XEkTzPsvskefPSmkhg
 YdgXs8TR3McaYHqYaYs7xO93F0/H/ZIGGxxEOa75iL/NIt+qXZURUjDesSCkZotYFFZ7
 mZvg==
X-Gm-Message-State: ACrzQf29yIdflG4UOiTJgwS3nZgSEjixx201sMr3q7Z2jsnPWPvO8f2c
 FhIiaE+6ed21dbgG4wDoPWa8nZ5H9Z23O/RfHqZt5KEgKRr93qOnHTd6fOkjaCaQpOoJLFAFU6q
 78asNQxEBK2X0xRQ=
X-Received: by 2002:a17:907:8b0f:b0:783:6169:5bc5 with SMTP id
 sz15-20020a1709078b0f00b0078361695bc5mr6030366ejc.200.1664529175665; 
 Fri, 30 Sep 2022 02:12:55 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5luAAkK9qCl5ylJnugFViozh/N08TYoL4/nsA47Z3kQBvuilMymZ1lWmRZ+Anm30kPnEYDAg==
X-Received: by 2002:a17:907:8b0f:b0:783:6169:5bc5 with SMTP id
 sz15-20020a1709078b0f00b0078361695bc5mr6030356ejc.200.1664529175478; 
 Fri, 30 Sep 2022 02:12:55 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 bq10-20020a170906d0ca00b0073c82539183sm882520ejb.91.2022.09.30.02.12.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 02:12:54 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: John Millikin <john@john-millikin.com>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH v2] scsi-disk: support setting CD-ROM block size via
 device options
Date: Fri, 30 Sep 2022 11:12:44 +0200
Message-Id: <20220930091243.35060-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220804122950.1577012-1-john@john-millikin.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Queued, thanks.  Sorry for the delay.

Paolo


