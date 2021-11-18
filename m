Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC8F455D1E
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 14:57:50 +0100 (CET)
Received: from localhost ([::1]:38444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnhvB-0002Js-KJ
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 08:57:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mnhtg-0008Te-KG
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 08:56:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mnhte-0006LU-CW
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 08:56:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637243773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MUxWRv2LhE2ZIda4sUXHJycfwnszeksAIgCJLebxb/c=;
 b=WZsKkmqtj8IBzojqdqo5NC63EWoIgs5HlFyr2DaeqwLacUR7by5cMoKKuSAV/RN5S19WXT
 f3rqoHcm3n7imxj0jJsrt2xqbygV4tQvKOTFgSv243EHRzZf9jUA9EaMw8qJIGLUxi7avk
 QGZy82Nl/tqaCn1TQrMLvpTYpolQ+hQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-208-yWQe4NE7OS2rr8VAJe5OhA-1; Thu, 18 Nov 2021 08:56:11 -0500
X-MC-Unique: yWQe4NE7OS2rr8VAJe5OhA-1
Received: by mail-wm1-f71.google.com with SMTP id
 g11-20020a1c200b000000b003320d092d08so2631761wmg.9
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 05:56:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MUxWRv2LhE2ZIda4sUXHJycfwnszeksAIgCJLebxb/c=;
 b=V3bxM96+J+we9nd0Se6CBAc0ERHIY1UAZqo87EwI1xdQoqixgOaI3vKs4VLQpCL0EK
 nayejglnxvzycZGfydSpdFz+nGSheHCaZ3iMHQPCU40asTZlPq7eLbuLdZP6m+L80yZ5
 HFXkcKg2a3te0/6XqknsLT2HR2aMhQLjjw1XCd64tBH1I0Es/Kq7S40Hhd2yTYaaVo2E
 u2Hu05ZBYO5QX5/3iaQ8Cgtl3fYRr2odHZvSyKFhwq89ssg9Nye0BtxH7VOneGgbhQ4T
 qGz39FnZU9ITm5h9zigWLo0M+nBDCxUI3ZQvZAJk4njmahFtIq94ZkveuQBAJBOV8emr
 NPew==
X-Gm-Message-State: AOAM53162IkU6tx/FI2An33ULbhkoouoXT9oVkXOE7vqqdZ99V2Ixb3r
 ph866nb7FIaBqhpmLbB7Txcv+eqZnzP+zyLoS0lKlP8oQT97wLkvriwkdQ7ZOozWaJ9n6TTmvX6
 8CqQGrPeCL6xQHBI=
X-Received: by 2002:a7b:c770:: with SMTP id x16mr10626626wmk.66.1637243770225; 
 Thu, 18 Nov 2021 05:56:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx5PXp89H0+OhLx//i3QHYO+oIfmTMgnIZjzCp3gxrQPAsfMM//Uigv22EqAp4WW+F/tu9xnQ==
X-Received: by 2002:a7b:c770:: with SMTP id x16mr10626582wmk.66.1637243769985; 
 Thu, 18 Nov 2021 05:56:09 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id e8sm3158670wrr.26.2021.11.18.05.56.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Nov 2021 05:56:09 -0800 (PST)
Message-ID: <3abf61e7-aa20-b096-19ad-7d7f21a959c6@redhat.com>
Date: Thu, 18 Nov 2021 14:56:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [qemu-web PATCH v2] Add Sponsors page
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211118122912.4051779-1-philmd@redhat.com>
 <e7fd1a86-09f5-95a5-a307-8cd72e12c426@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <e7fd1a86-09f5-95a5-a307-8cd72e12c426@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.084, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Thomas Markey <admin@fosshost.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/18/21 14:41, Paolo Bonzini wrote:
> On 11/18/21 13:29, Philippe Mathieu-Daudé wrote:
>> Add a page listing QEMU sponsors.
>>
>> For now, only mention Fosshost which requested to be listed:
>> https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg05381.html
>>
>> Cc: Thomas Markey <admin@fosshost.org>
>> Resolves: https://gitlab.com/qemu-project/qemu-web/-/issues/2
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> Microsoft is also sponsoring QEMU with free Azure credits, though we
> aren't using them yet...

For now I'm following Stefan recommendation from v1 [*]:

  "I would only include organizations that ask us to display
   sponsorship information to keep things simple."

I am not aware of Microsoft asking to be listed, should I add it in v3?

[*] https://www.mail-archive.com/qemu-devel@nongnu.org/msg836665.html


