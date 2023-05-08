Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A01D16FB3AB
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 17:21:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw2fb-0002mx-V0; Mon, 08 May 2023 11:20:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pw2fa-0002m5-8l
 for qemu-devel@nongnu.org; Mon, 08 May 2023 11:20:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pw2fY-0003FK-Qd
 for qemu-devel@nongnu.org; Mon, 08 May 2023 11:20:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683559256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JMIwpyRbwPqKrrTQ7LLiDtXCSyu2L6+4sc0in1BTfHk=;
 b=fAxHjd44KXQ6qBaMgj4PdErg6VBsQNRC/BgxJcTFvXpDbPhZ2CqFI/1lgw4ifRpX4gGUso
 0LxouNr02Hx+oryk2dusQPaU8AIcintGGjRUXkGwQfSHpfwRsp4BflqwMBHpI2L12o9R0x
 47aV1FG7n15by5PtkApepz5Qi3OdhGM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-353-EqczOW5sPNu58lcd02oJuQ-1; Mon, 08 May 2023 11:20:54 -0400
X-MC-Unique: EqczOW5sPNu58lcd02oJuQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-307814dd87eso1202778f8f.0
 for <qemu-devel@nongnu.org>; Mon, 08 May 2023 08:20:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683559253; x=1686151253;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JMIwpyRbwPqKrrTQ7LLiDtXCSyu2L6+4sc0in1BTfHk=;
 b=ePt+SPtun2nm4E52nVQ2fnJs8pzsySHTDPs1ktvZEtC+3KZAyXCybK6Kxj+6j7dWNu
 0JqqQ1o0inyIZijGi7ZSHWKOkMMEk94hSS2ZqrnUITqVeAJcoX0kbBXfemzoJCaJ4Qpc
 livQQSe05wGx6U6zxsbqnLnJXSBxVWXeL9WHxeKaApeBuO2TVybYyXBbA/Jw1jJmosYn
 Zwgtpjyayw8UakyoK6KCe1jNYetC9kAnR4tyTLKPUyNxBpzbXJw6g7fWIUzeUnMCM7ZD
 +sJPFLxYKAb8xd38uhDrLGhGi4lfrFPUxKf/HVQvxX0xmKVyFF9p+7FGSqyjlubqSICF
 PBsg==
X-Gm-Message-State: AC+VfDxHGG9NeYB7v70QdKjmVQdonrwFlQL+zLFnEGgcBuOpyu9eoiHd
 euMeH1nOUH0K6bkT++wJsVk2hc5ZmMQow7bnm41wbYFBQsROo9/u7oxeocsms/ktHvqRcInXcLD
 gzMQpJWV01Gy6cqk=
X-Received: by 2002:a5d:670a:0:b0:306:c590:c26 with SMTP id
 o10-20020a5d670a000000b00306c5900c26mr7495229wru.10.1683559253569; 
 Mon, 08 May 2023 08:20:53 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6iLqta6eEZPNQRYJ+rsV8d8P7C/LRqyzZWUXBWhBHRULYvfIg+O30nSn4UXasWuZMP4vcf+w==
X-Received: by 2002:a5d:670a:0:b0:306:c590:c26 with SMTP id
 o10-20020a5d670a000000b00306c5900c26mr7495212wru.10.1683559253301; 
 Mon, 08 May 2023 08:20:53 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-212.web.vodafone.de.
 [109.43.179.212]) by smtp.gmail.com with ESMTPSA id
 d18-20020adfe852000000b002fe13ec49fasm11550726wrn.98.2023.05.08.08.20.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 08:20:52 -0700 (PDT)
Message-ID: <41716ec0-2207-5b3c-3d42-8c51426b14df@redhat.com>
Date: Mon, 8 May 2023 17:20:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 83/84] exec/poison: Do not poison CONFIG_SOFTMMU
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
 <20230503072331.1747057-84-richard.henderson@linaro.org>
 <c0e49af2-21dd-03db-0604-194a298d7a58@redhat.com>
In-Reply-To: <c0e49af2-21dd-03db-0604-194a298d7a58@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.802, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 08/05/2023 16.27, Thomas Huth wrote:
> On 03/05/2023 09.23, Richard Henderson wrote:
>> If CONFIG_USER_ONLY is ok generically, so is CONFIG_SOFTMMU,
>> because they are exactly opposite.
> 
> I thought there was a difference ... at least in the past?
> But looking at meson.build they seem to be handled quite equally now:
> 
> common_ss.add_all(when: 'CONFIG_SOFTMMU', if_true: [softmmu_ss])
> common_ss.add_all(when: 'CONFIG_USER_ONLY', if_true: user_ss)
> 
> Paolo, do you remember whether there was a difference in the past?
> 
> Anyway, as far as I can see, it should be fine now, so:
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>

For the records, I withdraw my Reviewed-by here (since we should rather do 
it the other way round and poison CONFIG_USER_ONLY instead):

Nacked-by: Thomas Huth <thuth@redhat.com>


