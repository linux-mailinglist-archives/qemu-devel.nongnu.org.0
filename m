Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F2C663AA6
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 09:13:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pF9bG-00078t-I9; Tue, 10 Jan 2023 03:03:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pF9b1-00075O-Qk
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 03:03:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pF9ay-0007Ya-MF
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 03:02:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673337773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y47hS1pQCSzr0g6/KhG82kNdxko1grv51BWAxeVXKpo=;
 b=FuJ/45sUvy66d9aWPxhg3yBZ+3svX/txE4DcT0csq06PgR9GyYJaRJPvgznFqfmKwp5x8w
 hdPDPaxeZEHLMrn9/D91aqpjSI31ts+NAkiBQUBMINfHkikm8LgaNfkqJyFe3FX6VcSiHc
 sofcgbVBw51GGB8IvbeyJ8yRsOmNRIY=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-252-LhLANyPsMWS-4az5c_4qig-1; Tue, 10 Jan 2023 03:02:52 -0500
X-MC-Unique: LhLANyPsMWS-4az5c_4qig-1
Received: by mail-vk1-f199.google.com with SMTP id
 l198-20020a1fa2cf000000b003d59c74e0b0so3559535vke.20
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 00:02:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=y47hS1pQCSzr0g6/KhG82kNdxko1grv51BWAxeVXKpo=;
 b=KjW22Mi2FUv6vd9UXpa8HoiY8s7SA1eOLfoFvyo1uHU5GbpVoGZQfD9sHAXPX3V1B1
 ZMqEYH0qDvRjZsy/sB7Vj9e81WL6qlxGATIJ8CMurlGofyhM5Tsl7CgwtMYNl7AiVjvi
 ysGE/13SI6QRV5Wj3Pz0qDXv6yKAEQiDz6qAlX9dljv0ZBj8mNEQgbLGYudB5eAwjSx7
 nn48o7GKZso2EFbz3AackusNyjJFbqerqcqg0R1QMeucg3QvxS+dqRfC4hYhSVoOWfqs
 UNbzv3vbEN89Weh6rAZDQgqBacrHbkLExqpog2j/Ny+7nB8Ci/40fLXMtlvZvWYOrfi0
 fdYw==
X-Gm-Message-State: AFqh2kriDh6T4rTNKLeMTOpdIJBwXbZQtZJjfkQI+5fwNIEcC4Os0N9c
 prxZT2js8ewYAfsermeOVQ6dR6owA7cXXocURyC1Z/4uyYGSpotLYakp1PIcssTW6WY0eNvMHXd
 gHmlKXXzlKWoazok=
X-Received: by 2002:a05:6102:3d8b:b0:3b5:36cc:a5f5 with SMTP id
 h11-20020a0561023d8b00b003b536cca5f5mr36418817vsv.35.1673337770798; 
 Tue, 10 Jan 2023 00:02:50 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtg33QTeVTv4ncwL70Jqz9Sy4ZvmjGzHXT49T3gldxRfW7i4umh3is/EfsRbqr1H8v7boYlrg==
X-Received: by 2002:a05:6102:3d8b:b0:3b5:36cc:a5f5 with SMTP id
 h11-20020a0561023d8b00b003b536cca5f5mr36418802vsv.35.1673337770562; 
 Tue, 10 Jan 2023 00:02:50 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-179-237.web.vodafone.de.
 [109.43.179.237]) by smtp.gmail.com with ESMTPSA id
 y15-20020a05620a0e0f00b006f7ee901674sm6752235qkm.2.2023.01.10.00.02.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 00:02:50 -0800 (PST)
Message-ID: <35870ab3-1da6-c222-b708-06ac71a5883c@redhat.com>
Date: Tue, 10 Jan 2023 09:02:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Laurent Vivier <lvivier@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20230109224232.11661-1-farosas@suse.de>
 <20230109224232.11661-14-farosas@suse.de>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [RFC PATCH v2 13/19] tests: do not run test-hmp on all machines
 for ARM KVM-only
In-Reply-To: <20230109224232.11661-14-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 09/01/2023 23.42, Fabiano Rosas wrote:
> From: Claudio Fontana <cfontana@suse.de>
> 
> on ARM we currently list and build all machines, even when
> building KVM-only, without TCG.
> 
> Until we fix this (and we only list and build machines that are
> compatible with KVM), only test specifically using the "virt"
> machine in this case.

Why don't you fix it immediately? ... it shouldn't be too hard to add some 
"depends on TCG" statements to the machine entries in hw/arm/Kconfig, should it?

Anyway, if that's not possible (yet), I suggest to add your hack to 
qtest_cb_for_every_machine() instead, so you could change this in one 
central place instead of adding a hack to each and every test that uses this 
function.

  Thomas


