Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E802053A1A9
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 12:03:32 +0200 (CEST)
Received: from localhost ([::1]:47950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwLCN-0001Z5-Rv
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 06:03:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nwL9f-00083p-AL
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 06:00:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nwL9Z-0004QN-Va
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 06:00:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654077633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=FFKfQYb36MvKHJRWVqO3mcfyluNNhm/nbOkeCBC3r9zW43YLakDQOCZ3eJbblC+US9I6qu
 Rt7svZBYVebm4V2u5E4/8WIBRyjGswEA+QB/Y40O7Tlz5kB4UEvnPG3did9q8WmWvtwBRb
 dN/MG9PLawRc4n5heJ3EgGHqh7sx4GI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-486-jI179goeMq2aTAfPQlHqiQ-1; Wed, 01 Jun 2022 06:00:32 -0400
X-MC-Unique: jI179goeMq2aTAfPQlHqiQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 l2-20020a170906078200b006fed42bfeacso681242ejc.16
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 03:00:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=Qr5oQ9TGuXEKvhGsTjs09jwTfOdjQE+muKVZCP00u++fqYt2jMdRAggfyzRdIp1ROH
 5umgKHF4RVi2ZKBrA0n96b7xLfQIqg9aeO3aekR6e1vtuQRo97QO1MNMK79Hx3J7uceI
 dW2tcGcm1aiwpiLbiWeIVOqKgjjtnnFQVa4OmgRz79zeHe+bS5vQLzaGL/K5ebrfXLdA
 fcguPnRrltMgsqLfIvpfKTu+iCNmVGptWnAtdOYuC2oZQZPjBsoJphEwtX7kvVQeZoTr
 gVHqCB8MvRIYf4ThtEPyuHspqq0cG13Sbo7C0L0vGPULh4n1/gJwH/4CplqHNSX2Z4Ur
 6oDQ==
X-Gm-Message-State: AOAM532FFXoT9lEM9Uay/anAC6hllqqzVvCFUTdolUbStGdJsxAAPqCM
 LyLczDe2NU2gmcANuO1jQh8xaLB/b8eZHKEi4mXej82ngT0cm5YQ5/qS9kSsqbtKmCetJuuSsoj
 /UNPhEBveE1bU0oc=
X-Received: by 2002:a05:6402:e0d:b0:42d:c786:72fa with SMTP id
 h13-20020a0564020e0d00b0042dc78672famr20028590edh.312.1654077631188; 
 Wed, 01 Jun 2022 03:00:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMXHhmwpC9aBonJL4kzNlpRHCokJFRWpOsq/jhMEeKhqBH598VY3k5fiZ1mXfKJ/ryMH9iSg==
X-Received: by 2002:a05:6402:e0d:b0:42d:c786:72fa with SMTP id
 h13-20020a0564020e0d00b0042dc78672famr20028556edh.312.1654077630900; 
 Wed, 01 Jun 2022 03:00:30 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 a1-20020a170906368100b006fec69696a0sm513092ejc.220.2022.06.01.03.00.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 03:00:30 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, alex.bennee@linaro.org,
 crosa@redhat.com, f4bug@amsat.org
Subject: Re: [PATCH v4 0/9] Record/replay refactoring and stuff
Date: Wed,  1 Jun 2022 12:00:22 +0200
Message-Id: <20220601100022.973996-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <165364836050.688121.11980415709895333098.stgit@pasha-ThinkPad-X280>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Queued, thanks.

Paolo



