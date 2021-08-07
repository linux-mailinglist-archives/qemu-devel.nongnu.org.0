Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A533E340B
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 10:17:12 +0200 (CEST)
Received: from localhost ([::1]:60122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCHW3-0000QB-So
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 04:17:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mCHUv-0007RQ-73
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 04:16:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mCHUr-0007nh-4z
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 04:15:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628324155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DdPOhJVU6UVMReBtzPC7S65B6C7QoU/bZvwzfKX2FsA=;
 b=bt/WhXSUmLLufLf6eiy3xmF8zXX7/iJQqncak3sCMuA/VhKtBdCHE3L6D9e4wuU9GRmG1o
 5xf5h5pUVhoJusVxTbMOKpeSih6eJDo9ZXSvWrsDjYV0QiVesGj8KEQkk4r+sr21puC+Ov
 KrzF6D/F8G7f1+eZytNZVwYuTGIH3nM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-526-H4ucSiBtMQqOPaEs-sBhcA-1; Sat, 07 Aug 2021 04:15:54 -0400
X-MC-Unique: H4ucSiBtMQqOPaEs-sBhcA-1
Received: by mail-wr1-f69.google.com with SMTP id
 j16-20020a5d44900000b02901549fdfd4fcso3932116wrq.6
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 01:15:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DdPOhJVU6UVMReBtzPC7S65B6C7QoU/bZvwzfKX2FsA=;
 b=ODbeKcaeXzdjDB46plMz2wtT1YjIzQYv/g6fZALfjr0g9NfAbDeVKL+JDvv69JRZ8s
 jJ8af+dJSevB0Tki5zP7w9TjjIjA2s+YDUSeZQMzaS3hR3ptgep5NHGaJ2iV4ETvdYk9
 EJXI+vWhq9YLqplDyGHuKkMD8F5eHjGtTw17jXTjqT7TQ6NAzF4WSlJkYtD0vfAhE2iB
 N4YlH34e09EC+mNrV+x6yF4EStiA4zZe/3OLve/+l4dDDzfp0/CqpODkHU1ItA/Gvayf
 Ea8ijYDbwEB5cECLHUx6TREn1YU75GdLs08UMx+UqHbZVdWt9sgPOieQjl+mr2NsWedj
 TcmQ==
X-Gm-Message-State: AOAM532DEmIjPiRYGwnZhF7ueZT0JdYgk7yzqOK7PjZbr/TeZx2hHA11
 T/l4vXENWxjOi6l50eOcbTNGzVdTiv4l6+NTLpKffBdpRVFyZGHFjYlwqAPxoNke5T9bmqPpqK2
 n6ZiREYJQPVq6NXw=
X-Received: by 2002:a05:600c:4144:: with SMTP id
 h4mr6956970wmm.138.1628324153354; 
 Sat, 07 Aug 2021 01:15:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8C3diwEs+BLZI5ofb+r26hq7GLoMQCtT7qlf7MNXm1m5KOGCYLU2G9hfqfEF28eVhWnmclw==
X-Received: by 2002:a05:600c:4144:: with SMTP id
 h4mr6956957wmm.138.1628324153199; 
 Sat, 07 Aug 2021 01:15:53 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id q2sm1654553wrc.44.2021.08.07.01.15.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Aug 2021 01:15:52 -0700 (PDT)
Subject: Re: [PATCH for-6.2 00/12] qom: Get rid of all manual usage of
 OBJECT_CHECK & friends
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
References: <20210806211127.646908-1-ehabkost@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <434ed8d4-f52f-375b-99a0-dfd5cf656356@redhat.com>
Date: Sat, 7 Aug 2021 10:15:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210806211127.646908-1-ehabkost@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.619, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/6/21 11:11 PM, Eduardo Habkost wrote:
> This series gets rid of all manual usage of OBJECT_CHECK,
> OBJECT_CLASS_CHECK, and OBJECT_GET_CLASS.
> 
> All type check macros defined manually are replaced with
> DEFINE_*CHECKER* or OBJECT_DECLARE* macros.
> 
> All manual usage of OBJECT_CHECK/OBJECT_CLASS_CHECK/OBJECT_GET_CLASS
> is manually replaced with the corresponding type-specific wrappers.

Is INTERFACE_CHECK already converted / in good shape?


