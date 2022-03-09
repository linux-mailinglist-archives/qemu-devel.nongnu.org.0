Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1776A4D2F7E
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 13:54:14 +0100 (CET)
Received: from localhost ([::1]:41356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRvpV-0005GE-6S
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 07:54:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nRvnt-000455-SG
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 07:52:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nRvnr-0006lZ-Ic
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 07:52:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646830339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vaurydxiztrDdKA1jo1qNJQJYDeQAk8U6/yC6YEiKOU=;
 b=Mj8GXHqRSyTimsVppxLNL7zBlUfUeb9eOeaelrGd0EQqUgrt7X1qyXc1fq/Wwq2444dMMr
 5uEpQcj7UHlzE2Bxw2CfZkkzkGyqhkJF5Y3TNuQ/Gvffi9zo6GSb9sZ6BeWo5DkE5gKcz+
 ka7tn275mRd3BXBrrnJvIRRY5vgHBn4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-166-L2mcxvlnOkOmR4UAyGaSIQ-1; Wed, 09 Mar 2022 07:52:18 -0500
X-MC-Unique: L2mcxvlnOkOmR4UAyGaSIQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 f24-20020a1c6a18000000b00388874b17a8so937269wmc.3
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 04:52:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vaurydxiztrDdKA1jo1qNJQJYDeQAk8U6/yC6YEiKOU=;
 b=vfzL6AGj/f4pc+zbtpoyDluiFK0Fov1DAwSXKThRxx9epRhdKHJpR7ZlUzpAsI0rD5
 fVVkqx7q1vDABAdQz9D3AE9v6RZyWrTPHCSxqO7Xi8YjZLu/mibDWZ3H8Dwv5BLHFjUZ
 XrGDAwrzAidP0xwFN8kgcnXZXjq9XwhLdZ8PbmhMHXVo374SOidwMPjnXKIlyul+y9wb
 iuMwqpSEL19WJZpwhKf0qlGTaqCHq9QDVkGLPm2F1+lPBPQV/pQNW/u/3nKrBk7XRceH
 jqOzqoPmsti+4fDYit4xwREMPb8rG8N3wmojA63dXFSIq+Ju796t7MCwIq3AT/tSnJYz
 ALpw==
X-Gm-Message-State: AOAM530KYQbrApsCrrzUHZy1z1E9T4OxTDdfKphei+Xwf9UbgWN7fK6z
 mONzaocN63TrZ92UQpenOJ+Ms+aTNISyxy3dZH5kT39+kgjNN89/FqTSVBaQ3oeZyFf4F/KPHH5
 cuWb86G5R5Lr3hjU=
X-Received: by 2002:a5d:66c3:0:b0:203:7b33:30c7 with SMTP id
 k3-20020a5d66c3000000b002037b3330c7mr1466559wrw.74.1646830337761; 
 Wed, 09 Mar 2022 04:52:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxxgMMs/qcXquw/YlfEH3DE7x5zBeSYRKlhG9jgOfsA36UGNXnzYZnVsi3rT06UV0wOGwc0Nw==
X-Received: by 2002:a5d:66c3:0:b0:203:7b33:30c7 with SMTP id
 k3-20020a5d66c3000000b002037b3330c7mr1466548wrw.74.1646830337551; 
 Wed, 09 Mar 2022 04:52:17 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 l8-20020a5d6688000000b001f04ae0bb6csm1550203wru.58.2022.03.09.04.52.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 04:52:16 -0800 (PST)
Message-ID: <37f73e8f-f744-987e-df81-e1bc28cf72b7@redhat.com>
Date: Wed, 9 Mar 2022 13:52:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v7 22/22] gitlab-ci: Support macOS 12 via cirrus-run
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220306231753.50277-1-philippe.mathieu.daude@gmail.com>
 <20220306231753.50277-23-philippe.mathieu.daude@gmail.com>
 <f2898408-5082-7121-2496-fb296c48244d@gmail.com>
 <b05317e1-3659-2dce-4582-58bc6ca4a79b@redhat.com>
 <YiiehhaRPGWnM2Vn@redhat.com>
 <ae5f9f7d-e0b3-3d79-1fe1-d8dfdb1ba2b7@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <ae5f9f7d-e0b3-3d79-1fe1-d8dfdb1ba2b7@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-block@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Will Cohen <wwcohen@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/03/2022 13.50, Philippe Mathieu-Daudé wrote:

> Would it be beneficial to have a 1 per OS job during PR, and
> other jobs run nightly (once a day, not per PR)?

Is there a way to trigger nightly runs in gitlab?

  Thomas



