Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA3F3004A4
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 14:58:14 +0100 (CET)
Received: from localhost ([::1]:48548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2wx3-00040N-C6
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 08:58:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2wuP-0001ZR-8M
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 08:55:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2wuM-0007ks-2u
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 08:55:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611323725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=15OKGaHQA1dzU3skq205lwnFGZbzq/zNJPezmwFI/Dc=;
 b=CU5rLLKdGK/z9DdaXPfkpbAl3tEZJ4k4G1A6R7TPEnFX39k1Fi1Xx227soFJ2EvqsTE3Uu
 G122ijDzVmZjoPMdB5/aoXZcdOhL44Fa1GKIKQgLxN4j7iKbXAD6Jevkc767/ZIIZNa/96
 vgPwmrYOP96d+EYzZUuNTbq0sLIn57Y=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-d6v3ZndbM2KQtvkX5Fbxpw-1; Fri, 22 Jan 2021 08:55:23 -0500
X-MC-Unique: d6v3ZndbM2KQtvkX5Fbxpw-1
Received: by mail-ed1-f70.google.com with SMTP id m16so2919233edd.21
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 05:55:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=15OKGaHQA1dzU3skq205lwnFGZbzq/zNJPezmwFI/Dc=;
 b=s6RfwFFLbfSOYW84ncFNdFedt6mUf8Io9zVLwJUvSiGBNv40Bq+/VrwZNTHZtac/X3
 cukH5knmqR5EsfE56dhrnoC4KpClfnqCcyDBlEdFLq/PpYtQTWuw3T8WBF5mwhW1E6ly
 jfz5SKiX9gNkGS4Iyo2rDE+d+oIQrfl/pH6K0VCs2fIw81DeiZ4ZupYEKRM3fjzd42FI
 ZaYuTisKHGs9qmJQI8vmELSfg2b//ykNfHlNYrh9vdsBS4dB1DJkuikFZ6HLdv5OBRZe
 KdyfF0HUsJngtcr7LqJDM3aqPApoeROk4DoS5a2e32E89c86d1eMxXo0cKwdnenus+BK
 otDg==
X-Gm-Message-State: AOAM530lyiemaQPMWGTMaicTHEBJ6mwgk3pr7GCAOcjiIIhMhfrL13Jj
 SpmsHOuQPQ2y/a11C6tVEsM1+Nj7N/mEemiMLaRpZqVoiZ2k8Mt+/Fo+QnGoHJ5CSJFpe0WNtlV
 KKdo624P4C1TXVU8=
X-Received: by 2002:aa7:c44f:: with SMTP id n15mr3451029edr.150.1611323721757; 
 Fri, 22 Jan 2021 05:55:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwLdVFKHxgf+FCdJ1J1AURQb5oIb5egsJo5YxKGWDYyuVb5bzBSvrTHok0WfcTr93ftzSiO6g==
X-Received: by 2002:aa7:c44f:: with SMTP id n15mr3450984edr.150.1611323721526; 
 Fri, 22 Jan 2021 05:55:21 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id n26sm4467017ejx.47.2021.01.22.05.55.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jan 2021 05:55:20 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH v2 07/11] chardev: Let IOReadHandler use
 unsigned type
To: P J P <ppandit@redhat.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20181012002217.2864-1-philmd@redhat.com>
 <20181012002217.2864-8-philmd@redhat.com>
 <3eefc179e8217ef0ec52080fc003796f70b112fe.camel@linuxfoundation.org>
 <s33o7756-7r9n-329n-6664-99p3o665qoos@erqung.pbz>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a77e5084-3fd4-7e6e-1768-87bbfe30866c@redhat.com>
Date: Fri, 22 Jan 2021 14:55:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <s33o7756-7r9n-329n-6664-99p3o665qoos@erqung.pbz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.221, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jan Kiszka <jan.kiszka@siemens.com>, Jason Wang <jasowang@redhat.com>,
 Palmer Dabbelt <palmer@sifive.com>, qemu-devel@nongnu.org,
 Alexander Graf <agraf@suse.de>, Max Filippov <jcmvbkbc@gmail.com>,
 Michael Clark <mjc@sifive.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Alberto Garcia <berto@igalia.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Markus Armbruster <armbru@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Laurent Vivier <lvivier@redhat.com>, Corey Minyard <minyard@acm.org>,
 Amit Shah <amit@kernel.org>, Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, Peter Chubb <peter.chubb@nicta.com.au>,
 Zhang Chen <zhangckid@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Michael Walle <michael@walle.cc>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Prasad, Richard.

On 1/22/21 12:52 PM, P J P wrote:
> +-- On Fri, 22 Jan 2021, Richard Purdie wrote --+
> | If so can anyone point me at that change?
> | 
> | I ask since CVE-2018-18438 is marked as affecting all qemu versions
> | (https://nvd.nist.gov/vuln/detail/CVE-2018-18438).
> | 
> | If it was fixed, the version mask could be updated. If the fix wasn't deemed 
> | worthwhile for some reason that is also fine and I can mark this one as such 
> | in our system. I'm being told we only need one of the patches in this series 
> | which I also don't believe as I suspect we either need the set or none of 
> | them!
> | 
> | Any info would be most welcome.
> 
>   -> https://lists.gnu.org/archive/html/qemu-devel/2018-10/msg02239.html
>   -> https://lists.gnu.org/archive/html/qemu-devel/2018-10/msg02231.html
> 
> * Yes, the type change fix had come up during patch reviews above, and this 
>   series implemented the change.
> 
> * Series is required IIUC, didn't realise it's not merged.

Audit from Marc-André pointed that this is unlikely, we asked the
reporter for a reproducer and got not news, and eventually closed
this as NOTABUG (not even WONTFIX):
https://bugzilla.redhat.com/show_bug.cgi?id=1609015

Regards,

Phil.


