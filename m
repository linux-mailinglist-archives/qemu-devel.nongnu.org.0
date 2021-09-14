Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F357E40B437
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 18:09:43 +0200 (CEST)
Received: from localhost ([::1]:37442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQB0B-00015X-0k
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 12:09:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQAke-0002PY-QV
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 11:53:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQAkb-0003kn-Nm
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 11:53:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631634816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6hUwwzfi7ZCFW20LiJr9iIjQbHTM6ICVlhLWMEND5eY=;
 b=F/yKRAahJSGmOC+x0OtFIhZimzJkqFPFbX4qI8jhLAWq43aNvtPFMV5UMS4GZki6txKFUO
 k7xfhDrrNxUFY7XDlHulK4Xw/qbQmWtQaUlQeJBGCvVR4iFLdFAe91R812J/tBIcR+Srca
 sGgZNh+1zQRg1OLmvdIIQ2WOeITMyfw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-xLAPavsoPpinp-Nhvw0xAQ-1; Tue, 14 Sep 2021 11:53:35 -0400
X-MC-Unique: xLAPavsoPpinp-Nhvw0xAQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 w25-20020a1cf6190000b0290252505ddd56so6651861wmc.3
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 08:53:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6hUwwzfi7ZCFW20LiJr9iIjQbHTM6ICVlhLWMEND5eY=;
 b=K7XPFSthyVNCBF+smwVczLHqHujUZg4W5Viz2Q1UI53X2j88brhhmtKQ+8Cij6ylcq
 p8X/f7oawJ6uRtY5dkBGbfhuzRaTd7Bo/E3ho7bD1WS8F+/vQpdXnByDqwt/7anXQih8
 jZ5BVNDPk8n6gUt3QR6U7IpvfkPMQDfPB543ZSqOaKSzHbV4Wpuw8UK8dwBORAnS1kCn
 NqL1YxJp7Ihyu21t1wUkly5bsET5ORXAgRhlDtjSa/b1+zIbnKwJHp5VNZ3pNXEY4bEr
 WbmXXkYcgfmn+XH6g6a0aImlKvqZ85VsGVoS7URy9FktJiUHmT41QYEEsibqUV3wbfjg
 YE4Q==
X-Gm-Message-State: AOAM532PVFsvFcRtic0IZFIYGw1KHSJlLmTeus4p3rHw1RwF+mtYrSLy
 UKEHy09bI8V7Xhmq0NwJmra3a0XYVJDrnz9uv6a9E5F/QUXL7Q0Xbmsru7RLEvbWMeKWKUwFpCP
 TuTI3RwN5Cm7K3qo=
X-Received: by 2002:a5d:63d2:: with SMTP id c18mr19252673wrw.311.1631634814299; 
 Tue, 14 Sep 2021 08:53:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHHNaPVddGYd3jAil39+4NY0g1upviTmy4TdnEsM1WbSlcVhAV279zp7hUBa0vYHP7SnHymw==
X-Received: by 2002:a5d:63d2:: with SMTP id c18mr19252627wrw.311.1631634814088; 
 Tue, 14 Sep 2021 08:53:34 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id a10sm10977861wrd.51.2021.09.14.08.53.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 08:53:33 -0700 (PDT)
Subject: Re: [PATCH v2 06/53] hw/core: introduce 'format_state' callback to
 replace 'dump_state'
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210914142042.1655100-1-berrange@redhat.com>
 <20210914142042.1655100-7-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c3ad4843-02dd-380e-a09b-91c80a25b052@redhat.com>
Date: Tue, 14 Sep 2021 17:53:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210914142042.1655100-7-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Eric Blake <eblake@redhat.com>,
 Marek Vasut <marex@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-ppc@nongnu.org,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/14/21 4:19 PM, Daniel P. Berrangé wrote:
> The 'dump_state' callback assumes it will be outputting to a FILE
> object. This is fine for HMP, but not so useful for QMP. Introduce
> a new 'format_state' callback that returns a formatted GString
> instead.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  hw/core/cpu-common.c  | 15 +++++++++++++++
>  include/hw/core/cpu.h | 13 ++++++++++++-
>  2 files changed, 27 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


