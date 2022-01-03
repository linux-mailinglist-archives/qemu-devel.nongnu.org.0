Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6BB483809
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 21:36:58 +0100 (CET)
Received: from localhost ([::1]:55306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4U4f-0005MU-CN
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 15:36:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n4U3h-0004eR-B5
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 15:35:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n4U3d-0006Nb-6l
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 15:35:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641242151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=39X8l4bVnmzpIddDjFE7Wgn7MLuaIEpkoBpLCcugMS0=;
 b=SEcicPljn4+lkM/IIRNUc4u920+6RbxOM1RmHXozaSjI0JHJHcQEn3t58qp94tkHIF108P
 U7KNGv8EunjzuNU2ybDdN4r36BuVYwCJ24A0YegC6FbLvMAEExQ1U9QPqreWSWAljk2D0D
 qk1lc3f1EBxo20Auo0oESjP4ql9blW4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-389-OXtjCiU5NreXXUz71FX9jA-1; Mon, 03 Jan 2022 15:35:50 -0500
X-MC-Unique: OXtjCiU5NreXXUz71FX9jA-1
Received: by mail-wr1-f72.google.com with SMTP id
 f13-20020adfe90d000000b001a15c110077so10649504wrm.8
 for <qemu-devel@nongnu.org>; Mon, 03 Jan 2022 12:35:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:from:subject:content-transfer-encoding;
 bh=39X8l4bVnmzpIddDjFE7Wgn7MLuaIEpkoBpLCcugMS0=;
 b=L6joy2obg4i3ytMkLQCc1GHkkcHfXvccx6ooONwhn+HEA2VyhD23aQPbLIii2tCjvK
 CfpeqeIyOUfzUNuUK37SOpVnuXeG5Jktl+oGtl9qKZjFl/4ttSR10+nnsJWyxblTGyJZ
 8MMj2LbxIDlJQB7r4LVEpje3MpRtlh7odOhpn4PMkRCOoiPX8xVzXuyYvq7pD/PO5Uh4
 1mUuf6iwdENb3EEnqN8w8F6stZPK5jOSOC0FlIlrOdQU0mmc+PGkBmdwia4oYsJT7kX2
 +Tq9SnE1orK4D3WAovuLh6M82FmVuASQsPurL0xeYfckMflvQGrk3pGeGU5HbIThXf6e
 0USQ==
X-Gm-Message-State: AOAM5333pyTHEqFFY198LluH6FNlfnx6tT1yvjtus84VjfVafqhc4xQJ
 Ct1328zEUKDA69MxVaW7JEaOxqN3vZFisBuKkKxhl5Kp11BOXGmG+95RA92avYmOtaqkt4Ew2GV
 N2EOy5azb/dBnvUDW1h64ii2UjSZNedGdROGMt6fHF6bAHRUq1Sfml3g7ctqEcpE=
X-Received: by 2002:a05:600c:3b24:: with SMTP id
 m36mr38635733wms.4.1641242029419; 
 Mon, 03 Jan 2022 12:33:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw/ZW/532NCHPfLj8CgIPFMz0FlKNBaRbHDbYDWzMTJoHv1lfCNM21wOIZ2MPTf9SGwdAt4vg==
X-Received: by 2002:a05:600c:3b24:: with SMTP id
 m36mr38635723wms.4.1641242029166; 
 Mon, 03 Jan 2022 12:33:49 -0800 (PST)
Received: from [192.168.8.100] (tmo-098-68.customers.d1-online.com.
 [80.187.98.68])
 by smtp.gmail.com with ESMTPSA id g18sm35374185wmq.5.2022.01.03.12.33.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jan 2022 12:33:48 -0800 (PST)
Message-ID: <23807667-2b98-60d4-b3f8-dd571e2f5927@redhat.com>
Date: Mon, 3 Jan 2022 21:33:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
To: QEMU Developers <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Something broke "make html" and "make man"
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.37, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


  Hi!

"make html" and "make man" do not work anymore:

$ make help | grep -B1 html
Documentation targets:
   html man              - Build documentation in specified format
$ make html
   GIT     ui/keycodemapdb meson tests/fp/berkeley-testfloat-3 
tests/fp/berkeley-softfloat-3 dtc capstone slirp
make: *** No rule to make target 'html'.  Stop.
$ make man
   GIT     ui/keycodemapdb meson tests/fp/berkeley-testfloat-3 
tests/fp/berkeley-softfloat-3 dtc capstone slirp
make: *** No rule to make target 'man'.  Stop.

Anybody any ideas how to fix it?

  Thomas


