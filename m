Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E623F6187D1
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 19:42:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqf9r-0003Ho-Lf; Thu, 03 Nov 2022 14:41:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oqf9a-0002vf-4N
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 14:41:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oqf9R-0006QF-3p
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 14:41:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667500856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=HObTjtupyhwtE9exCSc63BZ1toghoZBp7SrAG8xgZybL03q15h3UQQclArn9uqJKBYPAZb
 PDgcHg+bsBZ8Oe0x79GF3J9WT17EQna3oviC7ZRS+EywRRaadq4uGsWPQwpbBDB7486I2L
 UvcMQqVT9SiEAV+fqq+ZbfaHJkZO/Ck=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-292-xPW3X8r9M6a3hdWh0Pmh9g-1; Thu, 03 Nov 2022 14:40:55 -0400
X-MC-Unique: xPW3X8r9M6a3hdWh0Pmh9g-1
Received: by mail-ej1-f69.google.com with SMTP id
 gt15-20020a1709072d8f00b007aaac7973fbso1811506ejc.23
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 11:40:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=IHIfmAuDtfU8DKIMf0hYT1WqM0KdByOiBbXkmIlGBjlL861e/RweKhT3KpjVsyrX4h
 V5W+phskGKTbvjHSxwctNtjK8oPMFe5iVq38jum1V53yXIKaKUOAJsrpK39j2q03Xlz4
 2QQCJuHGhf1jPpm6g0Iq7nW0+FTtnJ/gxdolB850kGFJ4oBNwA4KjAq7/5JfpROAADIx
 CSVAvehfe1PHcOvraxhjl5fA03SCbLN+qriGtv/YVYJgsTmuSagKjkT3a5BiySqDAof4
 fPosj+uolR8vm6HbGCTnaMkM02Rp7NnecaNWNfOiz5+iffY1vni+YcZlbMMg/7CYr/RG
 +Z3w==
X-Gm-Message-State: ACrzQf34nEbhmyLPoD5ugOB9LqgSC/2+KupU2lZsk5AdYyB0uwPiMUXn
 mVGAnW10LjLGhozCeUeO8euCTagZaZppxsKwgfUYBd/6HqpocLkBy5g6koKxu4XvUoIvxAqbXJM
 EaQoJRAwN1Ime8bwwD5Fc2LQ7JylhNDBECrLp8jrZER3yVe9nKJmX24V9pNqpcIeFo6E=
X-Received: by 2002:a17:907:78b:b0:741:3d29:33d2 with SMTP id
 xd11-20020a170907078b00b007413d2933d2mr31960153ejb.103.1667500853535; 
 Thu, 03 Nov 2022 11:40:53 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7/cls7dcY+oedsGGvVB/8oFb8Or6Swzb9jyog5hRpaeN8gC7a7QXHhmbDbTH6Wryr7HKBqlw==
X-Received: by 2002:a17:907:78b:b0:741:3d29:33d2 with SMTP id
 xd11-20020a170907078b00b007413d2933d2mr31960134ejb.103.1667500853271; 
 Thu, 03 Nov 2022 11:40:53 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 d7-20020a056402000700b00458824aee80sm843803edu.38.2022.11.03.11.40.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 11:40:52 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Stefan Weil via <qemu-devel@nongnu.org>
Cc: qemu-trivial@nongnu.org,
	Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH] Add missing include statement for global xml_builtin
Date: Thu,  3 Nov 2022 19:40:48 +0100
Message-Id: <20221103184048.177105-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221103083815.464612-1-sw@weilnetz.de>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


