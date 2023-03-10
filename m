Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CF16B4A28
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 16:19:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paeVV-0004kM-H4; Fri, 10 Mar 2023 10:18:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1paeVR-0004jb-J4
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 10:18:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1paeVO-00022a-Rl
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 10:18:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678461481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r4duduEoAxMdu33kZxVuJL774cJlzxpw+p9v3Ihfwfc=;
 b=N6UHhw3H6M23B/++bwshaNvcJ5EGj+HDtAwCCofmbPx/WyVI8ICJ3hKAndT906X9OWjGQV
 NQDpQRr78ORwi2vxz3R+CwQL+3CVYwFPAPcj/CPqj38YADxX0tmiqxpad8j8ICxEZrCRiR
 eBDPbEslGZ0zQEe1nikgwrpHRui8VKI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-270-ECCj4ZRVOi66xPEa_ja9Ng-1; Fri, 10 Mar 2023 10:18:00 -0500
X-MC-Unique: ECCj4ZRVOi66xPEa_ja9Ng-1
Received: by mail-wm1-f70.google.com with SMTP id
 p22-20020a7bcc96000000b003e2036a1516so3991049wma.7
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 07:17:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678461478;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r4duduEoAxMdu33kZxVuJL774cJlzxpw+p9v3Ihfwfc=;
 b=EpYEZhOzPmX8lPCbgJ4o8JylDZ3ql6Sm7VVu1I+uLoLL72Sa6LwUSLa1eNbBGf3d+b
 KnTFYkID2aM/ohXxJTM0Qa5/RktIjqKIOx4Qwxmd5TwOnP0V+YY+v0jiTkG6d7u5zlt/
 5IvdC8WEz9h/OEMThbuFP5ZjI9a5UdINTNzIiA4Wk3YQCS4R9DJFXGmMswyHrVe+7X2l
 XLK7D7JmXmDgZwsyTXJemI51iphcJDBovzGMyFzSNOXFKoXBPw0/t3iv0Y6/uquQZk9k
 HA3LA0mcnnRF4FLRoFmq0nzU2iczJycYviwbj0m4I9dWk6n0i4qgCfpLollVd4edkNs9
 F0Tg==
X-Gm-Message-State: AO0yUKWgNgHt4Bp0obG0Ufg/fKtOaZhM8FxdMwkxrGCjo+Iav6EgY+xB
 cC40DECmDpJ6D9oMAOok87zgdXpp1AxF+625+gDzxHY3DZui8ipwiNxvdEV2fXCVAMi0LzYBtlE
 PSr4h5Z6cBJ/jlK8=
X-Received: by 2002:adf:f812:0:b0:2c7:17a2:b70 with SMTP id
 s18-20020adff812000000b002c717a20b70mr16624224wrp.69.1678461477900; 
 Fri, 10 Mar 2023 07:17:57 -0800 (PST)
X-Google-Smtp-Source: AK7set9UJJ7ds+ZJp28Sl2ReekYrLjVsl77L+TCKhz6gxc7zY8dfKOcxBfRMcls/O7oBUQdG6fmAWg==
X-Received: by 2002:adf:f812:0:b0:2c7:17a2:b70 with SMTP id
 s18-20020adff812000000b002c717a20b70mr16624198wrp.69.1678461477607; 
 Fri, 10 Mar 2023 07:17:57 -0800 (PST)
Received: from [192.168.2.110] (p549d1c92.dip0.t-ipconnect.de. [84.157.28.146])
 by smtp.gmail.com with ESMTPSA id
 r12-20020a5d494c000000b002c59e001631sm41201wrs.77.2023.03.10.07.17.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 07:17:57 -0800 (PST)
Message-ID: <0a2fcaf6-169e-a947-c03f-3aadba10da73@redhat.com>
Date: Fri, 10 Mar 2023 16:17:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v8 08/11] tests/qtest: Fix tests when no KVM or TCG are
 present
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Laurent Vivier <lvivier@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20230309201434.10831-1-farosas@suse.de>
 <20230309201434.10831-9-farosas@suse.de>
 <20230310050550-mutt-send-email-mst@kernel.org> <87h6useoxy.fsf@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <87h6useoxy.fsf@suse.de>
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

On 10/03/2023 14.06, Fabiano Rosas wrote:
> "Michael S. Tsirkin" <mst@redhat.com> writes:
> 
>> On Thu, Mar 09, 2023 at 05:14:31PM -0300, Fabiano Rosas wrote:
>>> It is possible to have a build with both TCG and KVM disabled due to
>>> Xen requiring the i386 and x86_64 binaries to be present in an aarch64
>>> host.
>>>
>>> If we build with --disable-tcg on the aarch64 host, we will end-up
>>> with a QEMU binary (x86) that does not support TCG nor KVM.
>>>
>>> Fix tests that crash or hang in the above scenario. Do not include any
>>> test cases if TCG and KVM are missing.
>>>
>>> Make sure that calls to qtest_has_accel are placed after g_test_init
>>> in similar fashion to commit ae4b01b349 ("tests: Ensure TAP version is
>>> printed before other messages") to avoid TAP parsing errors.
>>>
>>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>>> Reviewed-by: Juan Quintela <quintela@redhat.com>
>>
>> I don't like it that we are hard-coding the list of accelerators
>> like this. Make a wrapper?
>>
> 
> Are you thinking of some sort of "has_any_accel" wrapper?

I think in the long run, we want something like what I described here:

https://lore.kernel.org/qemu-devel/ee0cad00-a6f3-f0c1-adf0-ba32329354f3@redhat.com/

>>> @@ -2120,6 +2119,13 @@ int main(int argc, char *argv[])
>>>   
>>>       g_test_init(&argc, &argv, NULL);
>>>   
>>> +    has_kvm = qtest_has_accel("kvm");
>>> +    has_tcg = qtest_has_accel("tcg");
>>> +
>>
>> why are you moving these? init at declaration time is
>> generally cleaner.
>>
> 
> Thomas had asked me to put calls to qtest_has_accel after g_test_init. I
> just brought the existing one along for consistency. From the commit
> message:
> 
>   "Make sure that calls to qtest_has_accel are placed after g_test_init
>   in similar fashion to commit ae4b01b349 ("tests: Ensure TAP version is
>   printed before other messages") to avoid TAP parsing errors."

Right, otherwise this might cause problems with the latest version of glib 
(in Fedora, I think).

  Thomas


