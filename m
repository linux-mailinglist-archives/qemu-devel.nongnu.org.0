Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AF76D63C2
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 15:48:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjh0t-0004uu-GK; Tue, 04 Apr 2023 09:47:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pjh0o-0004uT-59
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 09:47:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pjh0l-0007tx-RH
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 09:47:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680616067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NXZVAuXURCCUeEyCJ3Apt7MqMRoeGh4PQRIsfTgOkBg=;
 b=AlCXdUX7xqvf2HVLFCl3NylzhQR53UQzrRAV/RnJLJNXmNwvTBQ372XIqcn7HEarQgmSdI
 HFIf26++mhKTFdS7dWdP157lRS4fizS44qTorRAdCbIFzsqYRAWxMxmXqZK2RqkAjfMTsF
 cfpk09hIHc/HmUb8K5V5e4JQiuJE/Ro=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-nPLVLLZfMFi5C_HqytbzMQ-1; Tue, 04 Apr 2023 09:47:45 -0400
X-MC-Unique: nPLVLLZfMFi5C_HqytbzMQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 a40-20020a509eab000000b005024c025bf4so33951687edf.14
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 06:47:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680616065; x=1683208065;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NXZVAuXURCCUeEyCJ3Apt7MqMRoeGh4PQRIsfTgOkBg=;
 b=akZNyswhUqAHZGBhVEECtjC5GU23JovtdpxXnQEf7wt3Zw8phb7UAKzf6vn9VsWq3H
 BOv1uoG2+zUSQdd/aRxRmZAYMwTSfmDZF2ZW3P5+HMQxMgOYHV6gaPGX7JATYeOx7Ky1
 R5xblxc2GNWJn5kmZEDodoKdeKXjTvGDjGA4OvUIfnE7R2E9c0Eb+FNsZ0z35c7GdPl0
 PECwSI1MSW7rzSnWc3XBMclE3XB5os4Mao2MMVHxr0j+mmIGWdLsXWwAeGeq9zU6sjgD
 7hKY91WmxPNDFuyU/AF2SQP4t6OnQQH1OcZnvJnPHvjVP/766GNKCRSgDgILsQ7cDtui
 BAkQ==
X-Gm-Message-State: AAQBX9eobtMmgBh861XnTbbCj0TrHzIArr+nBColvSQfl+UjoHWb728B
 PvKJdDTe5vhh9Bq0RaimNiw88CPvgySa6XJnpr46vjFK7VmyfntwMKp8+InS/2S/gFMIms5tMPd
 6WvieiJ9DuJX+lW4=
X-Received: by 2002:a17:906:68ca:b0:931:b4d3:fc7f with SMTP id
 y10-20020a17090668ca00b00931b4d3fc7fmr2638027ejr.30.1680616064890; 
 Tue, 04 Apr 2023 06:47:44 -0700 (PDT)
X-Google-Smtp-Source: AKy350bTUWpDfEkQMztCXSp3lAzmKMLlNkSrHzGGYgK9EE7DOW/ArYgtjIo2Ha6U6gSgxkvegrzexA==
X-Received: by 2002:a17:906:68ca:b0:931:b4d3:fc7f with SMTP id
 y10-20020a17090668ca00b00931b4d3fc7fmr2638000ejr.30.1680616064630; 
 Tue, 04 Apr 2023 06:47:44 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 u25-20020a170906109900b008e22978b98bsm5996684eju.61.2023.04.04.06.47.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 06:47:44 -0700 (PDT)
Message-ID: <df512475-d1b0-eb76-9a0b-28760b5a73d2@redhat.com>
Date: Tue, 4 Apr 2023 15:47:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 01/13] virtio-scsi: avoid race between unplug and
 transport event
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Julia Suvorova <jusual@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Peter Lieven <pl@kamp.de>,
 Coiby Xu <Coiby.Xu@gmail.com>, xen-devel@lists.xenproject.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Garzarella <sgarzare@redhat.com>, qemu-block@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>, Paul Durrant <paul@xen.org>,
 "Richard W.M. Jones" <rjones@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Fam Zheng <fam@euphon.net>,
 David Woodhouse <dwmw2@infradead.org>, Stefan Weil <sw@weilnetz.de>,
 Juan Quintela <quintela@redhat.com>, Xie Yongji <xieyongji@bytedance.com>,
 Hanna Reitz <hreitz@redhat.com>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 eesposit@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>
References: <20230403183004.347205-1-stefanha@redhat.com>
 <20230403183004.347205-2-stefanha@redhat.com>
 <2bbe988c-0802-55c3-b2a3-05e3f94e2f04@linaro.org>
 <20230404130658.GG428487@fedora>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230404130658.GG428487@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.925, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/4/23 15:06, Stefan Hajnoczi wrote:
>> Would this be more useful as a qdev_is_realized() helper?
> Yes. There are no other users, but I think a helper makes sense.

Agreed; anyway,

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo


