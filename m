Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 735CF60E583
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 18:33:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onjJr-0006IW-Ku; Wed, 26 Oct 2022 12:31:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1onjJG-0004WT-B5
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 12:31:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1onjJD-0000EW-E4
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 12:31:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666801866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=M2HRgcaixl1vmoQ7jhurTIL9hqVdP6Nox8K0BT9eQXg1hCs8TGxmMmeXX24HAGFw9D6VL5
 tpkVuUEF9nKDsQOgsrgGDESkgqqrPJIXa3rm7CcMJqZC2yM3ozBSyYshxG70R9T/FufWBv
 qoYATRVvIoT6YjAsP9yoEUVJ5aXXJ9A=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-260-JbIpNMLcN1COBp8Wq3b-5g-1; Wed, 26 Oct 2022 12:31:05 -0400
X-MC-Unique: JbIpNMLcN1COBp8Wq3b-5g-1
Received: by mail-wr1-f69.google.com with SMTP id
 n13-20020adf8b0d000000b0023658a75751so5636268wra.23
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 09:31:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=GcTDmHHW/F8HchWV4GFER+P2TPcoqz7KJZnGx6Wwf2j5ikttdB0LgYbEPXUeCHJQ48
 godmZXkxa8wy7eh4p+0+/mUFJpF0TnghFxQ1z0Q1Cn+1+GlqHtpd3zShk7mQ+RPt7Ftk
 zyV0tfIerYGOVd6EiTJbca1ccQYpy8QOwHGNDCpwqeykGiolV4/SHgN1ChtE7PFq+0I3
 w73SzwjJUNE2DHaP8ZOvsu2ai9FyInGAMfcI4uF2HTbXCheCUOSQJMVc4Obvd8ufDTcT
 C2GlCBeyw7KN42RhM2dTZiETr7D5yGA+IWJM4whWTgCo7YGQTi4iTba6FJbl0zkksUXs
 fP6A==
X-Gm-Message-State: ACrzQf3GO6IEFn2Jnba4cmn6KRB9cU4C5pClvyyYG72+oL+0Qqy3QIbe
 Ek+wmpkYWsv5Bh5kHdUSyZknPclW1/4mgG4iLfA+CZXRJw+QGKOndsBB2LQLjQkjL/g1ur4eZOM
 FSZgi2TCsMXZqYRE=
X-Received: by 2002:a05:600c:4ec7:b0:3c6:e3d4:d59d with SMTP id
 g7-20020a05600c4ec700b003c6e3d4d59dmr3070102wmq.181.1666801864159; 
 Wed, 26 Oct 2022 09:31:04 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM53Qxk8pe+041h+gVHRqCVcWzQgGtQn9ZfMb230IwD/XwmIrI1hxUEuEFHTRIipXqcAMYw3Iw==
X-Received: by 2002:a05:600c:4ec7:b0:3c6:e3d4:d59d with SMTP id
 g7-20020a05600c4ec700b003c6e3d4d59dmr3070082wmq.181.1666801863930; 
 Wed, 26 Oct 2022 09:31:03 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 l5-20020adfe9c5000000b00236863c02f5sm3958618wrn.96.2022.10.26.09.31.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 09:31:03 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Zeng Guang <guang.zeng@intel.com>
Cc: Sean Christopherson <seanjc@google.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 kvm@vger.kernel.org, Gao Chao <chao.gao@intel.com>
Subject: Re: [PATCH v3] target/i386: Set maximum APIC ID to KVM prior to vCPU
 creation
Date: Wed, 26 Oct 2022 18:30:59 +0200
Message-Id: <20221026163059.325663-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220825025246.26618-1-guang.zeng@intel.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Queued, thanks.

Paolo


