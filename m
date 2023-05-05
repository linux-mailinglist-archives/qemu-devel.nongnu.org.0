Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A28B6F7F22
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 10:32:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puqqr-0005TW-95; Fri, 05 May 2023 04:31:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1puqqn-0005T7-U1
 for qemu-devel@nongnu.org; Fri, 05 May 2023 04:31:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1puqqZ-0003wa-Ti
 for qemu-devel@nongnu.org; Fri, 05 May 2023 04:31:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683275482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=X3VrHIt54Ft0yrJPL3pO0zuvZX1dEIVBB59sgDQsWAj6b7Xl/3ujHQBUiM8EufL7aFFiFq
 3DwF66WaN3c3VjDn2a/dm0JJweFtMG5oI3QMr7MxZiIdGz5OgIPqjuGznQL7DytKX5vl6d
 aYIOxLKW3QcTOg2xoHDbkPH320cnoLQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-xLaLrq88PtqJk2XZoeI9jw-1; Fri, 05 May 2023 04:31:19 -0400
X-MC-Unique: xLaLrq88PtqJk2XZoeI9jw-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-965b9e29579so155395466b.0
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 01:31:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683275478; x=1685867478;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=eenJ5oaeKFEn9p6AAsETXmP8v8az3rKcxauCIKL8CDhIJFdmTfQfbPP+GBjjAnhCpQ
 r0QpdA8dUWnISMtns3SHnv5PQIST+kDSW9mufVjWqqgt/adjSLKhSq1/dkCCeKVjNnc9
 5/dYabn5kriCcL9VBbsIxosLSIcnz036c2k/EqovSRiOL2W8qKL4ClCMv79oCjcrQ5tT
 1e6GVPqu8WjAWXtc6zQ/4JCGQIlqmqJc21J7kcf//D4oCk4hzS7fj9OAcq5gX4He1D4l
 aNQGrO03DC1vYe5sIc5/8a4RtrAxKHIEckTpKdOeabLDn3zmYwKCJCQXYmvTTOkP3Dl5
 YQlA==
X-Gm-Message-State: AC+VfDzgjA6XvCOVgwXvdxGyT9GuczTHK1USMYK9Bcf72tAThn+uga9E
 g5NvW0wE7zDqkLxZj64eNoFPNy7mGDkBb7ReeeurSzQcdyY/Kkxh+Skkby8E0HOa5KIQT7mbFLt
 X4BjxYIxN3SBIC+E=
X-Received: by 2002:a17:907:320a:b0:88a:1ea9:a5ea with SMTP id
 xg10-20020a170907320a00b0088a1ea9a5eamr393854ejb.65.1683275478235; 
 Fri, 05 May 2023 01:31:18 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ47UpNCtDUMm+GtsuZ12J5zXngGazIrJDUL717pYZDeruU5J1EfBTnknDT9k0Mqqvc5kkvltQ==
X-Received: by 2002:a17:907:320a:b0:88a:1ea9:a5ea with SMTP id
 xg10-20020a170907320a00b0088a1ea9a5eamr393833ejb.65.1683275477852; 
 Fri, 05 May 2023 01:31:17 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 bz6-20020a1709070aa600b0095850aef138sm642491ejc.6.2023.05.05.01.31.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 01:31:17 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Babu Moger <babu.moger@amd.com>
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, weijiang.yang@intel.com,
 philmd@linaro.org, dwmw@amazon.co.uk, paul@xen.org,
 joao.m.martins@oracle.com, qemu-devel@nongnu.org, mtosatti@redhat.com,
 kvm@vger.kernel.org, mst@redhat.com, marcel.apfelbaum@gmail.com,
 yang.zhong@intel.com, jing2.liu@intel.com, vkuznets@redhat.com,
 michael.roth@amd.com, wei.huang2@amd.com, berrange@redhat.com,
 bdas@redhat.com
Subject: Re: [PATCH v4 0/7] Add EPYC-Genoa model and update previous EPYC
 Models
Date: Fri,  5 May 2023 10:31:16 +0200
Message-Id: <20230505083116.82505-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230504205313.225073-1-babu.moger@amd.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Queued, thanks.

Paolo


