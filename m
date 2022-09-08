Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E685B190F
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 11:43:56 +0200 (CEST)
Received: from localhost ([::1]:52522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWE4g-0003kL-P0
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 05:43:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oWE0h-00084r-Ke
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 05:39:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oWE0e-0003no-5d
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 05:39:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662629982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=cuHBm6TTdnWb83BKKuvcaBjpETzZnJBbs0rO57VVNa4/YMwCgHKF3LPYAlIbNXgHQqcVnP
 JOD4vAoPaVvNaMA1wMemie9/dH73fJPZ5DfwMYAoYS+cQIw/EHUCyz8VbTDjbXofpcTp7X
 SRWx0X0778C+djvbqAlsr2PiYURBwXw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-27-KZPDnTE7NO2o5b6CE4gB9A-1; Thu, 08 Sep 2022 05:39:41 -0400
X-MC-Unique: KZPDnTE7NO2o5b6CE4gB9A-1
Received: by mail-wm1-f69.google.com with SMTP id
 c188-20020a1c35c5000000b003b2dee5fb58so1014742wma.5
 for <qemu-devel@nongnu.org>; Thu, 08 Sep 2022 02:39:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=PZ7DcIKM9Y7rIj/xZA60zMr0Om5JJrqgnmU9V3iBJ1OViFWDeo6RwGPo/X5Bff89Uv
 GoV6xYtb0ILDN8GvEzcVTijFO7DFu0Yj2oMKaJ0g3ZumEw6W4Yeyo4h31A7FwxXuSwqB
 N+wX2FlMRhpHB0aFDs6diWCACihVTI5JCcg59w4IYTJDmAi1jYBm0Eg7epDevc3HuPxq
 JMcaOqX/rhPjUMfvXU/oBO9SEe7W4Iwy2UhmzIQypogqF5kLCjLZF0mv50FBTi2vUzKd
 ZoNW5L0nsFqiccAZqje8CyqebzfOuZNlls7F2FSo/saPWhaLiODpTkkuvpl6ZbvZ9wiI
 BjIA==
X-Gm-Message-State: ACgBeo2eq0Du/a2/LViKMGczR+9RW64RSegXmpTYUR2BEJzD9D6tafjx
 jKHKaNZKNWDoTeHxbhP2qzhBQjTgrr8Efk4bv8WlHGOBiHXMSK/wR54A/+/tMRBWqo3vvxnhCdz
 E5+8zF5VxgpfxB2c=
X-Received: by 2002:a5d:47c3:0:b0:22a:2e9f:b839 with SMTP id
 o3-20020a5d47c3000000b0022a2e9fb839mr1292581wrc.72.1662629980356; 
 Thu, 08 Sep 2022 02:39:40 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6ydXQnN7cZRGaC3++pjGGTPABmzvV0dnRw+2o1eNLJ4LuHJHljz3ZqDFYSM+y0g4RRqWIJgQ==
X-Received: by 2002:a5d:47c3:0:b0:22a:2e9f:b839 with SMTP id
 o3-20020a5d47c3000000b0022a2e9fb839mr1292569wrc.72.1662629980155; 
 Thu, 08 Sep 2022 02:39:40 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 n4-20020a5d4204000000b0022a2e4b2b25sm1576888wrq.113.2022.09.08.02.39.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 02:39:39 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH v3] audio: add help option for -audio and -audiodev
Date: Thu,  8 Sep 2022 11:39:36 +0200
Message-Id: <20220908093936.19280-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220908081441.7111-1-cfontana@suse.de>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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



