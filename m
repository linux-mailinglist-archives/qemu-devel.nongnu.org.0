Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C02365F4D
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 20:32:58 +0200 (CEST)
Received: from localhost ([::1]:44104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYvBA-0004OW-Vx
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 14:32:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lYv6q-0003Jq-Ft
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 14:28:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lYv6n-0004D0-RP
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 14:28:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618943304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ynMILBPjrnkkMlaqpr5C71HDruRd/nqxaUH4S2Rd2MQ=;
 b=dtkvA8VMK9R210mgird3Mb9Snvpzd4kO1IxQ7vTlGjMRRJkUmpofAck1dlZL2Jc4ZfBsDr
 pQRAY7sS9aFgOed4EOg1gT+FMpiAmyFTDWuRqW1uhprBAHaIyz1oINPrwYGFtmP4UUFREk
 8J07GrOQzb6A438p126dsf596SqvzVs=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-UxxoD_8lNXuw91UWO1m0JQ-1; Tue, 20 Apr 2021 14:28:21 -0400
X-MC-Unique: UxxoD_8lNXuw91UWO1m0JQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 h22-20020a05620a13f6b02902e3e9aad4bdso3637854qkl.14
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 11:28:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ynMILBPjrnkkMlaqpr5C71HDruRd/nqxaUH4S2Rd2MQ=;
 b=qCpq+wssd8VQjNJGFpD9eH8zUe1VyppBL52pm9vdkbcdf/AUjvMHKh+7OHBTiKXifI
 xMeFKM920Y5stTaNEZ4laOFM65ZdOhvYg7YNJ02cY28SWlM/3Mxcl4mHeREZxejf6qD2
 ENzDOWSBMSZkLBjlJPD+hhBZm6vf8qnoOrbb13k0/E5q6+HZZ28b8CiGuZSS3IgVTkjI
 mBbZ/McOLobXmO74Gx9/AnNdQgHSNt/HyWOyDIYPm5DI0ueqc+TEvGKIHoWoBk5as9RU
 fQnwDw1n3yhpvhG+5on4c4YQ8j9ZnykvaX7BVTFFysHH2rzvm5xQ1CJDsZd/BKefI20Z
 Mz8g==
X-Gm-Message-State: AOAM530cZ+bLog2U9+nwdjkY13Z6yYpC4Dk2+4x8i6FCstHJjj+iHiTU
 XeUiHGhUn4nU6mjsqRTsADl9pLX6+ZVGuXyFF3vredtwnd3bo0O0f28zaK9oOiH/Uk02sIRjahC
 nMcRtsv6dLifLO80=
X-Received: by 2002:a37:2cc1:: with SMTP id
 s184mr18817023qkh.489.1618943301461; 
 Tue, 20 Apr 2021 11:28:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyX4BnVDH/cBsC+OFMbnFynUDU8JlPRmJbKggeS44RPeLIufdryLPoV0Y52FS6MRWBXplN3kw==
X-Received: by 2002:a37:2cc1:: with SMTP id
 s184mr18816990qkh.489.1618943301196; 
 Tue, 20 Apr 2021 11:28:21 -0700 (PDT)
Received: from xz-x1 (bras-base-toroon474qw-grc-88-174-93-75-154.dsl.bell.ca.
 [174.93.75.154])
 by smtp.gmail.com with ESMTPSA id n6sm11641563qtx.22.2021.04.20.11.28.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 11:28:20 -0700 (PDT)
Date: Tue, 20 Apr 2021 14:28:19 -0400
From: Peter Xu <peterx@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 01/11] hw/arm/aspeed: Do not directly map ram
 container onto main address bus
Message-ID: <20210420182819.GD4440@xz-x1>
References: <20210417103028.601124-1-f4bug@amsat.org>
 <20210417103028.601124-2-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20210417103028.601124-2-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Apr 17, 2021 at 12:30:18PM +0200, Philippe Mathieu-Daudé wrote:
> The RAM container is exposed as an AddressSpace.

I didn't see where did ram_container got exposed as an address space.

I see it's added as one subregion of get_system_memory(), which looks okay?

-- 
Peter Xu


