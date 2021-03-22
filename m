Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2753C344639
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 14:52:58 +0100 (CET)
Received: from localhost ([::1]:59494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOKzJ-0001ZY-51
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 09:52:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lOKeT-0004eq-U7
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 09:31:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lOKeL-0003W8-PE
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 09:31:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616419875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P9wOtL0sdcguX3pQST/qzsnzZgGzWIpzM1J26FPSipw=;
 b=ft7Ls1UDmGkne6zEMUHbY8zfMZfuzu5ISn/+A3G0wepm/iNaa7bn9oykEwvieWALVdavUf
 G3EcXLnIauyRKmc25VNtPaoP9vCkZbfahaxYsMbOOnKg6rbUBs/F8qCqXD95c7/hFKlYMH
 IIMX5cuviMzVxNdA3hLhpMX2AqIpGrc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-SMnBWdNCNO2kmxvf0CzSaQ-1; Mon, 22 Mar 2021 09:31:14 -0400
X-MC-Unique: SMnBWdNCNO2kmxvf0CzSaQ-1
Received: by mail-wr1-f70.google.com with SMTP id z17so26017567wrv.23
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 06:31:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=P9wOtL0sdcguX3pQST/qzsnzZgGzWIpzM1J26FPSipw=;
 b=e8iRmBxvgHetUe3OIBVvgBLLRmuMt/pARGv1gQ2l0pJTq2nT4va5SGopq4SPoIMvym
 Hx29+plVEA3gqhcubM6E4XNNr+OjinwYMYuO33CzFbxOWQqpuaH3mzFt8hPvaEvJ5AS9
 ce99Ru69gC5K8/8jSsCg2Qzwdc4zYVKZEYl7Fsi/Cyvu9M9/pnAU9YGh3CYl5Q2cm4Nc
 yNnrW7hDPhWE+OA+AjYa16bWPpUAFqoYzCTuk4eCDQKApNawuZmP7A1ITbF3g1uZ7XAo
 wf8ydruhizBtOT4z4Y8bwCqZANkiBZVVw/E6h7t0BKYFwmaUV9A699w7LpSqMYS4qp1B
 uVhA==
X-Gm-Message-State: AOAM531R0jM0SEnKZctTLydmkjjkjamlEgGjqwU24HaqOs2eEpCdBcW+
 DHfXhK6hPpNorOCjVe6TVNICGY6L+RKKs1P7j9vutKRCLpozVz68dNpa7cykOIbXSyQbO/MXqaL
 HWlUmtZ65kv0Jfgel35lMytPDyVPfVN4vhZeHUWA7Ytrc64rpDdWae42Gi3/7dbHaI6A=
X-Received: by 2002:a05:6000:181b:: with SMTP id
 m27mr18696757wrh.363.1616419872829; 
 Mon, 22 Mar 2021 06:31:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzlkDipATAO9q0jLt2Ux6qSnJr0LdfdjRdfY6TYwDD6jh0Lg3EkPEhWag+sZPvgYWrCK8g/nQ==
X-Received: by 2002:a05:6000:181b:: with SMTP id
 m27mr18696732wrh.363.1616419872655; 
 Mon, 22 Mar 2021 06:31:12 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id y16sm20029030wrh.3.2021.03.22.06.31.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 06:31:11 -0700 (PDT)
Subject: Re: [RFC] accel: add cpu_reset
To: Claudio Fontana <cfontana@suse.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210322132800.7470-1-cfontana@suse.de>
 <20210322132800.7470-2-cfontana@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e972fe2e-3871-422c-f85d-baea7066c55b@redhat.com>
Date: Mon, 22 Mar 2021 14:31:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210322132800.7470-2-cfontana@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/03/21 14:27, Claudio Fontana wrote:
> This surprisingly works without moving cpu_reset() to a specific_ss 
> module, even though accel-common.c is specific_ss, hw/core/cpu.c is 
> common_ss. How come the call to accel_reset_cpu works?

I don't understand the question.  Why wouldn't it work? :)

Paolo


