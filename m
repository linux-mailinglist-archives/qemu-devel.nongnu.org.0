Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C074E4110
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 15:18:27 +0100 (CET)
Received: from localhost ([::1]:53026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWfL7-00067T-Tm
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 10:18:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWfJU-00051T-SF
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 10:16:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWfJS-000578-Gn
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 10:16:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647958601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C+Ia/o5w0KuBVlI2VfclxI4n4TgHdRUs7FGHjXH5MXo=;
 b=LRDnTkGESEQdG4M5iHgMgZ2MrnJuxKU0mbBygj0o0y/0hQay05sW6ww3CuRsfA4Ecy/OZl
 llyweorJQjL1l3i3v0Yr7bGLgIYg2oDHjJmMHxLGdSf99cLzIa2g2gkeaAmi05ouIbKL3Y
 ziDfz4vmwywSU/iGiAnihQQeSytt7LQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-414-IvaTfmp_PFaXeAIzmtLeXA-1; Tue, 22 Mar 2022 10:16:40 -0400
X-MC-Unique: IvaTfmp_PFaXeAIzmtLeXA-1
Received: by mail-ed1-f71.google.com with SMTP id
 o20-20020aa7dd54000000b00413bc19ad08so10638556edw.7
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 07:16:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=C+Ia/o5w0KuBVlI2VfclxI4n4TgHdRUs7FGHjXH5MXo=;
 b=UV9JKPHahWLFVvuGhiq7+dVTPMyuK86VwfOMPgS+zMKySW8YaPry0FwLEdFmo+D18x
 dKkDhbrn0U9ZwzazKbYdupUXu0wfVdDhUGo022TGlP6bADPggvA6BMGEE/RzxqW09C+G
 v8FQ7DeKWzCqsR1hfiXgo/jELVpp5sh1fy9psY8y5DUA6572CsgEE7a2C2wpGjguOdtL
 98pvPowj5rPOsC7yA9OQdFlNSSF5XnVJ7KNk3oBDyww5Jbneu7GGxjsVc+H8YOXeY9PI
 lGV4xxaXVHh71lMJBAukvn3GcNMzoELQtY/SPqbqtS0WffffQFMUqZHfFhEX91vBPwXl
 vV9g==
X-Gm-Message-State: AOAM533QtXbe3a2EcB5CvAbuySo6DshnYM7eyl6QmN+RA6yv66eztX9Q
 lCPVq6UB2qYfw/kpD3CN20PjuczJLz5DVhE1/Aw0GmFsOmSefxeLSZXFG+KMYSfPuwQR7ZEXjAh
 RjC8fDq/7pd7lAko=
X-Received: by 2002:a17:907:7287:b0:6df:8f48:3f76 with SMTP id
 dt7-20020a170907728700b006df8f483f76mr24753239ejc.411.1647958599108; 
 Tue, 22 Mar 2022 07:16:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/UBhm6Uanyhh/Er410c29ffNkTC4yHsRDhB8irtpmZhkJdiRdv11sTY2q54hugMhQFdu3XA==
X-Received: by 2002:a17:907:7287:b0:6df:8f48:3f76 with SMTP id
 dt7-20020a170907728700b006df8f483f76mr24753218ejc.411.1647958598891; 
 Tue, 22 Mar 2022 07:16:38 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 s20-20020a056402015400b00418f9574a36sm7919701edu.73.2022.03.22.07.16.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 07:16:38 -0700 (PDT)
Message-ID: <2a1e5741-424b-6bb4-2b1b-64ff11be9625@redhat.com>
Date: Tue, 22 Mar 2022 15:16:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 03/15] iotests: Don't check qemu_io() output for specific
 error strings
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20220318203655.676907-1-jsnow@redhat.com>
 <20220318203655.676907-4-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220318203655.676907-4-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18.03.22 21:36, John Snow wrote:
> A forthcoming commit updates qemu_io() to raise an exception on non-zero
> return by default, and changes its return type.
>
> In preparation, simplify some calls to qemu_io() that assert that
> specific error message strings do not appear in qemu-io's
> output. Asserting that all of these calls return a status code of zero
> will be a more robust way to guard against failure.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/040 | 33 ++++++++++++++++-----------------
>   tests/qemu-iotests/056 |  2 +-
>   2 files changed, 17 insertions(+), 18 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


