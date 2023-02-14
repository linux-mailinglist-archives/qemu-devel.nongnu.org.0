Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02339695D0E
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 09:37:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRqn8-000775-PW; Tue, 14 Feb 2023 03:35:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pRqn5-00076k-VD
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 03:35:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pRqn4-0001TN-2T
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 03:35:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676363751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AyulltP36ldeiXLKiFnhw4/xRECmWzXGSsxt2Z2LHEo=;
 b=f0qc3lRodfYsCQjULWndoOIshhPeT1E28RVvCtDqFoaT0Yvbo9610+ycZ05dHlTEyoJaV2
 AVuahKMeqPqHCopUhUi4vshr/U479JftMOmiHylSFAGQo5H1ZenbYeEHGKOvkCnIsaQAP3
 ehwazT9eUrfz3p0BjX4APWZGOGXhfiw=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-481-hzF-AB_UNFyemF2FPsNWLw-1; Tue, 14 Feb 2023 03:35:49 -0500
X-MC-Unique: hzF-AB_UNFyemF2FPsNWLw-1
Received: by mail-qk1-f197.google.com with SMTP id
 bp30-20020a05620a459e00b00738e1fe2470so9091755qkb.23
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 00:35:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AyulltP36ldeiXLKiFnhw4/xRECmWzXGSsxt2Z2LHEo=;
 b=EnnKbaJJKXE34LZGAIBrujENKwQtMFY7zhN4eQ24FW1qxI5VZCFI9bEjQWMBtFlJ+h
 EihwrzMAdjpczaco4AH+EsqbquIjjMWHhTkyW8/BcOM3vb69Pix8624GkIYBJFNYZqNx
 ezmBio/s6xccJhGz1EU4COaj1NjLZyIvQ5w3xfiH7n4+qQTf9IfMNMD+k2VIPcg3qblf
 PHkPxduNtzkBGZVm0J9K2wswW5FQVVCjuDWE5rD57mOrD9S7bAIGFF8IWv5SJenwFfSa
 cbSnFxawFZ2thP5T6exGIV0Vf3x/8+aIBDNqHRs9otO64qldp74eQ83lcgl8vW5kC8Nf
 KlaQ==
X-Gm-Message-State: AO0yUKUm69kcH0pSUOXCfcvObF/fwL1T2W3tJOX+Rfzwb995v/9sLtlf
 YaMYZeIOuUDB3ILbtTP4KL+6qt2vR9RBkubWn6rViAZ8QWg7vUan96oplJQR06NxNQssf/X9NR7
 B0egoW8hKHivJiSY=
X-Received: by 2002:a05:6214:2483:b0:539:b68e:3444 with SMTP id
 gi3-20020a056214248300b00539b68e3444mr3818064qvb.27.1676363749182; 
 Tue, 14 Feb 2023 00:35:49 -0800 (PST)
X-Google-Smtp-Source: AK7set+6x6RKAyPi2KvzZAOWf91M9iMQLwOClkMEtO9BN9Yia2ldOIQJT9YxHaq2K/tFfnDKGup+wA==
X-Received: by 2002:a05:6214:2483:b0:539:b68e:3444 with SMTP id
 gi3-20020a056214248300b00539b68e3444mr3818038qvb.27.1676363748855; 
 Tue, 14 Feb 2023 00:35:48 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-176.web.vodafone.de.
 [109.43.177.176]) by smtp.gmail.com with ESMTPSA id
 u63-20020a379242000000b00731c30ac2e8sm11340841qkd.74.2023.02.14.00.35.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 00:35:48 -0800 (PST)
Message-ID: <553f238a-56f2-4bd0-382a-80cfe116f138@redhat.com>
Date: Tue, 14 Feb 2023 09:35:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Kevin Wolf <kwolf@redhat.com>
References: <20230210003147.1309376-1-jsnow@redhat.com>
 <20230210003147.1309376-7-jsnow@redhat.com>
 <CAFEAcA-c5y0TR8vYg_FYEmGv3mOOmBgeD0cyb+mVotsP=r-Dsw@mail.gmail.com>
 <CAFn=p-aDV9=vG6hjTWRE6c52TpYSjDBU22nthTuejDCv_XrYMQ@mail.gmail.com>
 <CAFEAcA_eGvz_BQVLhVWtedRh2mcBuMEhv0RKF+6DW4t+9FdPAw@mail.gmail.com>
 <Y+Z2Kcq17HGWuoTV@redhat.com> <87cz6cpue3.fsf@pond.sub.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 6/7] CI: Stop building docs on centos8
In-Reply-To: <87cz6cpue3.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.345, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 14/02/2023 08.40, Markus Armbruster wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
> [...]
> 
>> We don't have to drop python 3.6. It is a choice because
>> of a desire to be able to use some shiny new python
>> features without caring about back compat.
> 
> I read this on Friday, and decided to let it sit until after the
> weekend.  Well, it's now Tuesday, and to be frank, it's still as
> offensively flippant as it was on Friday.  It shows either ignorance of
> or cavalier disregard for the sheer amount of work some of us have had
> to put into keeping old versions of Python viable.

I'm a complete python ignorant, too, so I'm a little bit surprised of the 
amount of pain that these scripts are causing.

No matter of that fact, I think Peter still has a point that we have a real 
conflict here with our current support policy. So this either means that 
Python was the wrong choice for our needs (since it is moving too fast and 
causing too much friction), or we should really rethink our support policy.

I guess we're too deep into the Python rabbit hole already, and I'm not 
aware of any other good solutions (back to Perl scripts? No, thanks!), so 
it's likely quite impossible to tune that knob.

Thus we should maybe really start talking about our support policy now. I 
think the main problem is likely the sentence "Support for the previous 
major version will be dropped 2 years after the new major version is 
released". Maybe we should shorten that time frame to 1 year. The 2 years 
caused some confusions in the past already, since e.g. Debian only supports 
the previous major release for only one more year, and macOS also releases a 
major version each year ... so IMHO we could shorten the time frame for the 
previous major release to 1 year instead. People then could still continue 
building QEMU on CentOS 8, but they have to be aware that they might install 
other software like Sphinx manually if they want to continue using QEMU with 
docs there. What do you think?

  Thomas


