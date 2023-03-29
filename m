Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D104D6CDAD7
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 15:29:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phVqM-0003zg-T3; Wed, 29 Mar 2023 09:28:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1phVqL-0003zI-2x
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 09:28:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1phVqI-0003XF-OS
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 09:28:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680096477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BUiybnLJjOSohQ118rRbHygEUAx7oIB/uTUUWa3p8jU=;
 b=EX+57ESPxHge/1ZK1eylpF/gutNwsYW2IvbBSNNK0x7Ss3sRmHFIix1IVgbqDQcRGNvsIX
 Z3Glv97TBLlOaE093tXPkWCQkOHN2UjNn22APMFtOF5NctrBVBV67zkzzsz+7sc3GPvckq
 Md5IUwR/Mnri/I20hOwgfsWHzv2x5h4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-675-v1rqlwabNlqttMbOCgy5tQ-1; Wed, 29 Mar 2023 09:27:56 -0400
X-MC-Unique: v1rqlwabNlqttMbOCgy5tQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 h11-20020a0564020e8b00b004e59d4722a3so22276608eda.6
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 06:27:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680096475; x=1682688475;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BUiybnLJjOSohQ118rRbHygEUAx7oIB/uTUUWa3p8jU=;
 b=drNhl7uLLoEU4+R/5/iZnvj+8AhYf53AuySoL9GUJhvvMPzfIjN7MTJ4eMUJAHz/Ra
 KglNjXkilZSzs862GOKvF5SdE2Me1MPlQFRko2W/V2mraRTI34u5R+S5JN5xPm9egYaE
 AO47cn+3et3d6QNA2zOl0uAI5QcY6/Ufp3WWo/FGSCc1QHFKe/EPZmVE/fZdAM1gyFut
 XalCAqpQ2kgB504SthNr+ayQhquD0rrKcbOfsL+sFw5pWJafTtnVs5Yv5eUjOYOHqx3L
 kf0EZ/gqCoe4ofbik7orGFLhqaNgoWTJXpNmR16aDkqk8lWzhf6TI+44YORSkVSzVTz0
 C2Kw==
X-Gm-Message-State: AAQBX9fh7ICuAk0dFb9MnTryKE/+xweOEhPQ9PlARnCONGGLvwsT+pC0
 B2jpe4t8yoSGfBIZFR8GP9eb6lXPxU0xM+4myJlDu8+2JrVKDgfi4OwSGbgXsu+NDnLsbQHogok
 p53sfhDOSAPaW6fo=
X-Received: by 2002:a17:907:3f88:b0:909:4a93:d9d2 with SMTP id
 hr8-20020a1709073f8800b009094a93d9d2mr25749397ejc.2.1680096474949; 
 Wed, 29 Mar 2023 06:27:54 -0700 (PDT)
X-Google-Smtp-Source: AKy350Yv6FRG2MotmS5CfxYBo8usR9E0E9xVeN1p/VxePb9vOGTy0fShKAK74wuQSitfeP9UTqA5aw==
X-Received: by 2002:a17:907:3f88:b0:909:4a93:d9d2 with SMTP id
 hr8-20020a1709073f8800b009094a93d9d2mr25749367ejc.2.1680096474614; 
 Wed, 29 Mar 2023 06:27:54 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 ha8-20020a170906a88800b0093a6c591743sm11098344ejb.69.2023.03.29.06.27.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Mar 2023 06:27:54 -0700 (PDT)
Message-ID: <88e77761-e9fe-d473-a4fa-c1d553bff4f3@redhat.com>
Date: Wed, 29 Mar 2023 15:27:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH 3/3] configure: install meson to a python virtual
 environment
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
References: <20230328211119.2748442-1-jsnow@redhat.com>
 <20230328211119.2748442-4-jsnow@redhat.com> <ZCQ0x3cDXOUsSX76@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <ZCQ0x3cDXOUsSX76@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 3/29/23 14:53, Daniel P. Berrangé wrote:
> I would love to see a day where configure isn't involved in the
> build process. Obviously we can't put this new logic into
> meson as its a chicken & egg problem. Could we potentially
> have your new  python/scripts/mkvenv.py script be responsible
> for setting up meson in the venv though, so we can avoid
> adding more shell code to configure ?

Not sure this is the same thing a what you want, but I do have a 
pipedream of rewriting configure in Python.  At this point it has a lot 
more logic than it has command invocations.

John, do you think it makes sense to do the "pip install" steps already 
in mkvenv's post_post_setup phase?  Maybe by passing a version spec like 
meson>=0.61.5 in place of the simpler "--gen pip,meson,sphinx" that you 
have now?

Not for this series; just dumping some thoughts prompted by Daniel's 
question.

Paolo


