Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A787D45B918
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 12:32:32 +0100 (CET)
Received: from localhost ([::1]:55120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpqVr-00058N-QE
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 06:32:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mpqU6-0002qc-J6
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 06:30:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mpqU4-0007Hi-KJ
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 06:30:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637753440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ChIwTeAJv3A7skgm6MjqdS5ug74mRdoaZK0PsPh5E+I=;
 b=REUadb4XVuy5gT56j8CiauCsJgv6qGC1xXUCFr1eoSojGJje8fgAKzZ+cojGIsdhgYOwGA
 oEf8X1gs3MtD/w8HYnr/IF3NaeCSuWVkMYqcn8JTS292qJxcLsN/7CPflNls1XdO096kjT
 SNJtr2gqKTgiA4kc7cqYv514WmJ10dg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-313-SErruZcsNYOrN8S4_Szjhw-1; Wed, 24 Nov 2021 06:30:36 -0500
X-MC-Unique: SErruZcsNYOrN8S4_Szjhw-1
Received: by mail-wm1-f70.google.com with SMTP id
 j193-20020a1c23ca000000b003306ae8bfb7so1175564wmj.7
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 03:30:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ChIwTeAJv3A7skgm6MjqdS5ug74mRdoaZK0PsPh5E+I=;
 b=0ZMg1qEHSvbwpEEP9D62/9Bpysf4geaBuHMYgwOtujmPIA1f0MKdvroYeXdM68RxHt
 AG+cQj6aVPi5iIIVjB2/7j8x8JG0qKc/QQll3jP1pO9REvqhLbjHCsgUIYi7ygSHikEz
 JfZDVu4RwO1U3+uTYIQncR/yoFa72SfBjuKNEA1tWI1Q6ufn0FGALPEZaWbtlKVZXftg
 jVIjRLJCTtZsYgt3QguecmQ3nCEjPVFtST/TpX98V9I4O8X3Nq9eEJhuhnfCC3GfjA7/
 QhdNHslNLVOqfcoWlEKi/WRzjbL04s3WI7F3L2eHNffut1BS49/Fmem82PAFAqAWLPeb
 JyyA==
X-Gm-Message-State: AOAM532nlEELIW4incpA0O+BEuICLay5pWkFjJ0TFgg6mNWqGjyDfN+K
 Bvm+RLyEjPS1DlaEqKpSu/HOUZY5qONImm6Im1gmAIUU+unCGQs9XvtZwSDND5fA25YWFad8EPT
 TaoOsbQm7DGjNbjM=
X-Received: by 2002:adf:fe4b:: with SMTP id m11mr17352210wrs.136.1637753435618; 
 Wed, 24 Nov 2021 03:30:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxl8hjRGQny8JIUTIeIWH6tR+SFGMOaW0htII5bMHqW91+lyINpn3i27YPntU+wDB5D1U1qpA==
X-Received: by 2002:adf:fe4b:: with SMTP id m11mr17352179wrs.136.1637753435473; 
 Wed, 24 Nov 2021 03:30:35 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id u15sm4967213wmq.13.2021.11.24.03.30.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 03:30:35 -0800 (PST)
Message-ID: <b6cd20fa-4d38-2c9f-e5e1-eb891d1b935d@redhat.com>
Date: Wed, 24 Nov 2021 12:30:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [qemu-web PATCH v3] Add Sponsors page
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211124080519.440677-1-philmd@redhat.com>
 <cb04d11f-cfe4-5de3-6e46-345f2fafaad3@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <cb04d11f-cfe4-5de3-6e46-345f2fafaad3@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -75
X-Spam_score: -7.6
X-Spam_bar: -------
X-Spam_report: (-7.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Markey <admin@fosshost.org>, Alistair Francis <alistair23@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/24/21 10:42, Richard Henderson wrote:
> On 11/24/21 9:05 AM, Philippe Mathieu-Daudé wrote:
>> Add a page listing QEMU sponsors.
>>
>> For now, only mention Fosshost which requested to be listed:
> 
> This...
> 
>> https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg05381.html
>>
>> Cc: Thomas Markey <admin@fosshost.org>
>> Resolves: https://gitlab.com/qemu-project/qemu-web/-/issues/2
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> Since v2:
>> - don't explicitly state /what/ we're using the resource for,
>>    just that we've been granted it (danpb)
>> - list Azure Cloud credits (Daniel)
>> - list PLCT Lab (Paolo)
>> - list Wow/CIP United again, since other are listed (Phil)
>>    therefore do not include Stefan R-b tag.
> 
> ... no longer matches this.

Yes sorry. Posted v4 based on v2 so the desc is still accurate.


