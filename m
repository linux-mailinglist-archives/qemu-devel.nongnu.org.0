Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55194695B89
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 08:58:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRqCI-0003oH-RJ; Tue, 14 Feb 2023 02:57:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pRqCD-0003np-VI
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 02:57:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pRqCC-0002ah-Ff
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 02:57:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676361467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JVI/MvhJxWq0nyIXD2zwVdmvKeO9ehvLJtDSWw3szyI=;
 b=G+4wcuUBcd7nssI1pLLiThuwUFy/eKn5ndHVLhY3gvIvAHWP1BaCilTK7n+juvnNn4cUnl
 n5XNlzBpzr36wDH9ikZb0TmCQj56Ac7U+fT6Uc5PTa3ybMMKpEH7s3C/P5/AMeW8D9KHQa
 iVXPk3jaCEyEyA0rACNh372zWXmUybI=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-134-Sgqchjd9Pi-uHGC7ZqOYkw-1; Tue, 14 Feb 2023 02:57:43 -0500
X-MC-Unique: Sgqchjd9Pi-uHGC7ZqOYkw-1
Received: by mail-qk1-f200.google.com with SMTP id
 op8-20020a05620a534800b0073b2e9d5061so3831891qkn.5
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 23:57:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JVI/MvhJxWq0nyIXD2zwVdmvKeO9ehvLJtDSWw3szyI=;
 b=iHQpmgdnuTnJAsuSoKWzIQN0AAYmioqkddbns/yjtMwrW7KNtwg6kvzxYE+YSAQP9W
 T34daLwi2pC2IFnliJjQvUB1LLUTIAys2ozjYd8MUf2EbKIlYli9DXLfNf4fsusxDc8N
 dvVcf+vrds4+WC/eiR6KsFct6tWdXgXLoxryVB2n2n29ifKvb9/vVtv8lgYfG7/dgDRV
 cJHWdXkFOfxealPy7KbxrT9NNUAzhA2Ufbx6JwpKToftvuBLLW+iPoYva9XyZ8SZp/+B
 CEWXfIffdIfOWPIS5iJeOnqHw/IUrYNkVtfc7xpb93gzHikgNn/Xy4CyXqUpPrbJzU2E
 QL9Q==
X-Gm-Message-State: AO0yUKXMvHu1AZijqKyvLsut70rs1L60pEtpYtByjhN8pxJ/jujve8aA
 COLhR3wx0r4BvOBNJAS2YpdiW7+QDSQuHZ9sqGjdJnBPLkmFe5+5pWwCkwmDvLHgMh1EA358jls
 XUhh4aXnfJkF65OA=
X-Received: by 2002:ad4:5b88:0:b0:56b:eef6:6937 with SMTP id
 8-20020ad45b88000000b0056beef66937mr3324232qvp.50.1676361463272; 
 Mon, 13 Feb 2023 23:57:43 -0800 (PST)
X-Google-Smtp-Source: AK7set8DubI/doij29jIJL3LV1hXO2GcEVDhdb+L/UlXk2EJHw7wxQ3Jc+E5nBy31WMhqcTDg+37yw==
X-Received: by 2002:ad4:5b88:0:b0:56b:eef6:6937 with SMTP id
 8-20020ad45b88000000b0056beef66937mr3324217qvp.50.1676361463026; 
 Mon, 13 Feb 2023 23:57:43 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-176.web.vodafone.de.
 [109.43.177.176]) by smtp.gmail.com with ESMTPSA id
 d19-20020ae9ef13000000b0071ddbe8fe23sm11270657qkg.24.2023.02.13.23.57.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 23:57:42 -0800 (PST)
Message-ID: <b7eb8a4d-83cf-81b5-f80b-1ef5d9217fad@redhat.com>
Date: Tue, 14 Feb 2023 08:57:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 04/12] tests/qtest: Don't build virtio-serial-test.c if
 device not present
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20230213210738.9719-1-farosas@suse.de>
 <20230213210738.9719-5-farosas@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230213210738.9719-5-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.345, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 13/02/2023 22.07, Fabiano Rosas wrote:
> The virtconsole device might not be present in the QEMU build that is
> being tested.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   tests/qtest/meson.build | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 5c8b031ce0..84cd07bbb9 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -255,10 +255,14 @@ qos_test_ss.add(
>     'virtio-net-test.c',
>     'virtio-rng-test.c',
>     'virtio-scsi-test.c',
> -  'virtio-serial-test.c',
>     'virtio-iommu-test.c',
>     'vmxnet3-test.c',
>   )
> +
> +if config_all_devices.has_key('CONFIG_VIRTIO_SERIAL')
> +  qos_test_ss.add(files('virtio-serial-test.c'))
> +endif
> +
>   if config_host.has_key('CONFIG_POSIX')
>     qos_test_ss.add(files('e1000e-test.c'))
>   endif

Reviewed-by: Thomas Huth <thuth@redhat.com>


