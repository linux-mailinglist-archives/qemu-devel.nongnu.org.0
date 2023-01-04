Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E15E65D5D4
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 15:36:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD4sP-0008PC-Le; Wed, 04 Jan 2023 09:36:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pD4sM-0008Hf-Iw
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 09:36:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pD4sK-0000c7-KH
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 09:36:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672842975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2D+VLVr/WbRrDA39Zuj4DRqW4VPhf76PgoDHxt9Ov9c=;
 b=CRzNeaNEbwdBPlOfeLu6P7IWZ6vKrVOLoLMgkfFhLkbL77ha4uTilvGmVzQyLkWuE380UP
 g5ROAxPnvXbCv6KXi6LSJLbaubxMan3KTaOsvJ/S1f/N7WTH8OWNsyXpNn90FuTSBWszdG
 CoasUMBpJHqRTtHCV1os2/6U7yLYoWQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-478-Lf3hBnDuN1O1_MOJfj7mQw-1; Wed, 04 Jan 2023 09:36:14 -0500
X-MC-Unique: Lf3hBnDuN1O1_MOJfj7mQw-1
Received: by mail-wr1-f69.google.com with SMTP id
 i26-20020adfaada000000b0027c76c49445so3118598wrc.13
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 06:36:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2D+VLVr/WbRrDA39Zuj4DRqW4VPhf76PgoDHxt9Ov9c=;
 b=5ijMxZweFcoGIvz7RTqqkDphtAWvfIXy/OaKuYxXHJaxzXIEiViu4/xAxHxUeGJgTO
 SWaFbYKMwLKuPhrEYNPs9gYQvkqLO59JsycucoL69coTJ1AkFAYGxsaFsF/0WLItJIZb
 rV5JUGa+mfNCSV5ndD2NqJmWZvCL5O38skB4CkGaGhZ46LAKH+bKVdsYH5R9cakSufDZ
 +ANd51LT2EhR2UOqeml14b7HHNM9RrM9xsZgPa/35sHw/jA90LlEByEGQLUisdx6+a6w
 N98yQcVTnYx2v6mhxrz+zz71IImZh8fzmH/a/twGtdiaJl6L9Kz85A2KrRr6CQkHFGMu
 H/Vw==
X-Gm-Message-State: AFqh2kpXlnYy1K05LBKCE2ZrQeSUDsHkZqvc95KtlTtZLiSH7FsUi67j
 AvRd0flMWAZKBJ93r0NAYX6HtmRMpuEvTi3igIRLjDrdBmKobOPoLYkbXFIEhR7YOYJ7POEc4Gy
 QIxEBOZXL+3vIt5k=
X-Received: by 2002:a05:600c:5108:b0:3d1:ce35:4224 with SMTP id
 o8-20020a05600c510800b003d1ce354224mr33458404wms.11.1672842973234; 
 Wed, 04 Jan 2023 06:36:13 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtvHlwOFkl3xLHS80eNaKhz3RmCwGCQZ87heAvClexRITF20HvLCL7PzxwPSJiatXlBFs6Pmg==
X-Received: by 2002:a05:600c:5108:b0:3d1:ce35:4224 with SMTP id
 o8-20020a05600c510800b003d1ce354224mr33458389wms.11.1672842972978; 
 Wed, 04 Jan 2023 06:36:12 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-176-239.web.vodafone.de.
 [109.43.176.239]) by smtp.gmail.com with ESMTPSA id
 q14-20020a05600c46ce00b003d9bd56e9c1sm9199733wmo.11.2023.01.04.06.36.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 06:36:12 -0800 (PST)
Message-ID: <dfcd52a8-b5fa-6ad6-ae69-317f3dab664a@redhat.com>
Date: Wed, 4 Jan 2023 15:36:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4] tests/qtest: netdev: test stream and dgram backends
Content-Language: en-US
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
References: <20230103110049.120340-1-lvivier@redhat.com>
 <b9ebccdf-5cea-a051-46e9-f88a8c59a6ef@redhat.com>
 <f59bd50b-abf7-88ae-7c09-e5c204e08e9a@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <f59bd50b-abf7-88ae-7c09-e5c204e08e9a@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.708, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 03/01/2023 15.46, Laurent Vivier wrote:
> On 1/3/23 15:08, Thomas Huth wrote:
>> On 03/01/2023 12.00, Laurent Vivier wrote:
>>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>>> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>>> ---
>>>
>>> Notes:
>>>      v4:
>>>        - rework EXPECT_STATE()
>>>        - use g_dir_make_tmp()
>>>      v3:
>>>      - Add "-M none" to avoid error:
>>>        "No machine specified, and there is no default"
>>>      v2:
>>>      - Fix ipv6 free port allocation
>>>      - Check for IPv4, IPv6, AF_UNIX
>>>      - Use g_mkdtemp() rather than g_file_open_tmp()
>>>      - Use socketpair() in test_stream_fd()
>>>      v1: compared to v14 of "qapi: net: add unix socket type support to 
>>> netdev backend":
>>>      - use IP addresses 127.0.0.1 and ::1 rather than localhost
>>>
>>>   tests/qtest/meson.build     |   2 +
>>>   tests/qtest/netdev-socket.c | 434 ++++++++++++++++++++++++++++++++++++
>>>   2 files changed, 436 insertions(+)
>>>   create mode 100644 tests/qtest/netdev-socket.c
>> [...]
>>> +int main(int argc, char **argv)
>>> +{
>>> +    int ret;
>>> +    bool has_ipv4, has_ipv6, has_afunix;
>>> +    g_autoptr(GError) err = NULL;
>>> +
>>> +    g_test_init(&argc, &argv, NULL);
>>> +
>>> +    if (socket_check_protocol_support(&has_ipv4, &has_ipv6) < 0) {
>>> +        g_printerr("socket_check_protocol_support() failed\n");
>>> +        goto end;
>>> +    }
>>> +
>>> +    tmpdir = g_dir_make_tmp("netdev-socket.XXXXXX", &err);
>>> +    if (tmpdir == NULL) {
>>> +        g_error("Can't create temporary directory in %s: %s",
>>> +                g_get_tmp_dir(), err->message);
>>
>> Should there also be a "goto end" here?
> 
> No, g_error() is fatal.
> 
> https://docs.gtk.org/glib/func.error.html

Ah, alright, then this is fine, thanks for the clarification!

  Thomas


