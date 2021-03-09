Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8091332EF9
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 20:26:52 +0100 (CET)
Received: from localhost ([::1]:37718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJi0J-00028E-Ta
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 14:26:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lJg2h-00031k-6O
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 12:21:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lJg2f-0003nl-DZ
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 12:21:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615310468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0AE67cAPZJY8chQKOQmsktIOifoChSB3E3t0PP+IvFM=;
 b=VXuVtAb4VvFFsD9NAQTiDQd4rAEO9YxtLWaistzx8H8g2vF3myPx2L4WikbWliIjuewYOS
 ZLiXprRVzPDa54+s6+DR+39ozo8zhdA0FLba/Y7W+EKOc5ueAn3XzN5mY+33D8tPkyD+Wb
 5ZpsSRqfJjksbSuSK1LGdYoeC/meIX0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-74-2w-cWkoBN1qoNuYKGoEWLw-1; Tue, 09 Mar 2021 12:21:06 -0500
X-MC-Unique: 2w-cWkoBN1qoNuYKGoEWLw-1
Received: by mail-wr1-f70.google.com with SMTP id r12so6740051wro.15
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 09:21:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0AE67cAPZJY8chQKOQmsktIOifoChSB3E3t0PP+IvFM=;
 b=DTevJCYTF1D3x0pj25rlfqeCStJfBQHFFi2j56FmZvEOuSjNLeWIZ8oSs6YYWnvTF+
 BhbPra3SdQABm3asje71t/jaWrpzBaxegXrrKjee6o1yQGwit0ieszYnznNwhSvfW9pL
 TmT7t2xOHoaf9V2qLUDWyPMCfSn2E4RwDr1cLQcv5ESZ2XPR5sfBT9AcPPtYTbrL+jxE
 qivq5X8xxOjPBMbNbZawoLPU4ZPx5qLmqEBFe2X3CHOP4kVoYhrVLky0J2lOcY/AVePQ
 9e+XT1RMsDLBcKVa7EkzVdH4pP8Ym8Vk9ZnKG+413rv1BTDj/ZlDNaglojgvlKMamVxL
 HHwA==
X-Gm-Message-State: AOAM533R3Vu9N3DR/U07yWVCVIeOhCSnIrPPFsjiAZXicZnybSLu7Zk8
 vdUVuA7MO1hC3oAfaOPZiITJB+IGcHF5SmGeO0YlicRFtZatICBuJuh9rPviTJS8W5fuuyZOBiO
 upNPHrY4TV5OuCYs=
X-Received: by 2002:a1c:2155:: with SMTP id h82mr5314965wmh.169.1615310465735; 
 Tue, 09 Mar 2021 09:21:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzwp1OoO2fQMXJYdrgwF+6sk16RaVOGzbdTatJpBJGcC0TcSroVoH1g3nQT75CMdCfByZJO2w==
X-Received: by 2002:a1c:2155:: with SMTP id h82mr5314933wmh.169.1615310465526; 
 Tue, 09 Mar 2021 09:21:05 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id s11sm5364119wme.22.2021.03.09.09.21.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 09:21:04 -0800 (PST)
Subject: Re: [PATCH v2] usb: Un-deprecate -usbdevice (except for -usbdevice
 audio which gets removed)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20210309165035.967853-1-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <88c7a101-7cac-ed49-c45c-11fb7d7158d8@redhat.com>
Date: Tue, 9 Mar 2021 18:21:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210309165035.967853-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/03/21 17:50, Thomas Huth wrote:
> +``-usbdevice audio`` (removed in 6.0)
> +'''''''''''''''''''''''''''''''''''''
> +
> +This option lacked the possibility to specify an audio backend device.
> +Use ``-device usb-audio`` now instead (and specify a corresponding USB
> +host controller if necessary).

Perhaps "a corresponding USB host controller or ``-usb``.  No need to 
send v3 if you send it through your own pull request.

Paolo


