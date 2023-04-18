Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 156C96E65BB
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 15:22:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1polH7-0006yT-Ke; Tue, 18 Apr 2023 09:21:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erik.schilling@linaro.org>)
 id 1poghx-0003YG-Oc
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 04:29:02 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <erik.schilling@linaro.org>)
 id 1poghw-0007Lv-7C
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 04:29:01 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-2f3fe12de15so1367926f8f.3
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 01:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681806538; x=1684398538;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6LvL0HsH/Rp4XNBniooL+fT0q3eCcuW4TJf74hsB+UU=;
 b=tpvHp4P3i1pNUlJOM+WWz8eSl1PGnh64bSGuafTYqIe5fCaoVel09SiviDC3EsvNAF
 U269F/12iiR7a7hmdOsrP8TVNc33A7gAhczSGTdYvRRDJfNL3VhY8VQrQnLqzxJE7p4f
 8SWU+zCJPrkfmCkiV3qJWrDWprXoSzKdzGLRbkcs70cKjGbPRouH098Xan7r1uxngq0Q
 kPKu9F2r5NnjQy9EzY61/ItudGo9w28vjZdm65PC8i7ZWPNdx16O8uupg6y9ArIIlaD3
 1uUmB1jQit2LpZjOE7QCQt6NDNUV2falvY/eNyxSg8UKj+5gFdSiLN9hjOKdsy1tvyTL
 TQ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681806538; x=1684398538;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6LvL0HsH/Rp4XNBniooL+fT0q3eCcuW4TJf74hsB+UU=;
 b=SSaBOnccfbEEUAiaTRuMFF5C+LWXxaZC62yMSOE0ikt6Wi/hYRCU499P9nbQBKPX65
 3ihKucNxXLaDE5pzgZtv1TobcQDc7Z+Xq/pk7NKdY7668aCdKJNOy4Qo2PlcYxuhMTQn
 IkB8llsaJF+I/0p8/mDxJjcg9YkIM9P0WPhKXJxKXaNqIhfeu1PX/WfEc7+B4LlewXB5
 j3EEgN7WPS/+ugHk8n4/e4NC+UCWx5qz0HIaMqdIRU+N9k/e6ZXgSJJDh9RsQSb0A1Aw
 Y4/0mn5JiA3DLdcWp1V8wDgpQ3aWUL7EnKa3T1XQyUted4f/iD118LK0HPMfmTjXD+Uv
 32+A==
X-Gm-Message-State: AAQBX9dOXfPwZPuKzVm4DCJjy8LfH0RIy4OdmEfNkYx66xnROW1WhDOE
 JoWF2+iFeOjGI2KEoLo4dVyS9g==
X-Google-Smtp-Source: AKy350ZdQOSgZETO4PhrVbw8ciDbo+yYNOWEvC/xaybEnhIDIua3mnNn3Wr8LgkgHrwSNERkgsqBzw==
X-Received: by 2002:a5d:5741:0:b0:2f5:5fa1:d816 with SMTP id
 q1-20020a5d5741000000b002f55fa1d816mr1186038wrw.50.1681806538158; 
 Tue, 18 Apr 2023 01:28:58 -0700 (PDT)
Received: from [192.168.1.149] (i5C741FCE.versanet.de. [92.116.31.206])
 by smtp.gmail.com with ESMTPSA id
 c1-20020a056000104100b002cea9d931e6sm12466036wrx.78.2023.04.18.01.28.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Apr 2023 01:28:57 -0700 (PDT)
Message-ID: <650bf2ae-20b9-a5fa-3342-c069f680ddd7@linaro.org>
Date: Tue, 18 Apr 2023 10:28:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 06/12] virtio: add PCI stub for vhost-user-device
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 virtio-fs@redhat.com, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Viresh Kumar <viresh.kumar@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20230414160433.2096866-1-alex.bennee@linaro.org>
 <20230414160433.2096866-7-alex.bennee@linaro.org>
Content-Language: en-US
From: Erik Schilling <erik.schilling@linaro.org>
In-Reply-To: <20230414160433.2096866-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=erik.schilling@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.284,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 18 Apr 2023 09:21:36 -0400
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



On 4/14/23 18:04, Alex Bennée wrote:
> This is all pretty much boilerplate.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Erik Schilling <erik.schilling@linaro.org>

Tested with d6f9fb0 of a rust-vmm SCSI device [1] and -device 
vhost-user-device-pci,virtio-id=8,num_vqs=3,config_size=36,chardev=vus

[1] https://github.com/rust-vmm/vhost-device/pull/301

- Erik

