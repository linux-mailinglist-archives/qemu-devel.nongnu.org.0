Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5039F6D1D8D
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 12:03:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piBaG-0005ED-E4; Fri, 31 Mar 2023 06:02:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1piBaC-0005Dm-KW
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 06:02:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1piBaA-0002kz-8u
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 06:02:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680256925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xohx1tj/YPW6tf8X3qPvgAftP5O6cIH3fUzZ8U7KPDU=;
 b=PLTm8M6An866etfM0dwS5Ql2DB26AUFIkwS1AUW9etg0e5g+lmv3H5c9QIo1UVFhZvxdVL
 KENwIx52LeZ8lsa1lcT5zDmInh6s+E0yCi79pWXVRrlTmerpVunaiRvhYYZz40Pn6I+tjX
 0kaBD8JtjqcaIy5yRcSeqr2OymWSHEo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-QTcp-zVmMQyNn_bEIv3qnA-1; Fri, 31 Mar 2023 06:02:00 -0400
X-MC-Unique: QTcp-zVmMQyNn_bEIv3qnA-1
Received: by mail-ed1-f69.google.com with SMTP id
 b1-20020aa7dc01000000b004ad062fee5eso30895035edu.17
 for <qemu-devel@nongnu.org>; Fri, 31 Mar 2023 03:01:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680256919; x=1682848919;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Xohx1tj/YPW6tf8X3qPvgAftP5O6cIH3fUzZ8U7KPDU=;
 b=p+cn3g+cB97hlixNWnllW0kLqyOFIUBb5SU6eQAIj+dOQ4cj+4Rkj3pNK5ZZfvSYSI
 HuH4pDcMikNeAObE+YxUFKV5RtOk7eUoZ0gjGmccBlzYw5FXn+sfyIgOi5++U/IuhbXr
 qJzzVLGtkBvfaFTk0Yk+P+MutqDWwwUaXNHwwyr3cFYwYlSd3RKj4mnca3Htg5LEBt5+
 Q1e8db5J5a327Tf/LNXhtQrtngTYObYUsp6yxZTuidLh0cjRNimBn3B6vxLygFwcj1dN
 nfH8FGpcM1726KjNxHI1yeCQDzojfLurz8ku0ixlTfToV0cEw18+9hLISnkEK1MKUwGR
 AZ0Q==
X-Gm-Message-State: AAQBX9dP8oAI+1F60N29uTU/R6VihztoMDpi5C/0jTqyA6peu3xtONiN
 iae9kAJwlgxsszSnBD+PasuGtDXd9lzfBGikjV9khp6e+7g+5QHOASRpMCtXYmIhAia07AmtATz
 SDKTa3SVtn0SkF4o=
X-Received: by 2002:a05:6402:e:b0:4fa:d75c:16cd with SMTP id
 d14-20020a056402000e00b004fad75c16cdmr22742252edu.34.1680256919143; 
 Fri, 31 Mar 2023 03:01:59 -0700 (PDT)
X-Google-Smtp-Source: AKy350YKiVP3rXADRdhrDgCbsBXdnxatakYEDoJkpsC4ZO0bzLFfIsIQIajeYbABY6J7wzwPtW1juA==
X-Received: by 2002:a05:6402:e:b0:4fa:d75c:16cd with SMTP id
 d14-20020a056402000e00b004fad75c16cdmr22742234edu.34.1680256918884; 
 Fri, 31 Mar 2023 03:01:58 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.googlemail.com with ESMTPSA id
 cx7-20020a05640222a700b004fd1ee3f723sm830305edb.67.2023.03.31.03.01.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Mar 2023 03:01:58 -0700 (PDT)
Message-ID: <1f08066a-5104-cfdf-94c7-d5f7af33d256@redhat.com>
Date: Fri, 31 Mar 2023 12:01:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH 1/3] python: add mkvenv.py
Content-Language: en-US
From: Paolo Bonzini <pbonzini@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
References: <20230328211119.2748442-1-jsnow@redhat.com>
 <20230328211119.2748442-2-jsnow@redhat.com>
 <d49d0152-ff58-a317-7eca-a243ed080ca0@redhat.com>
 <CAFn=p-bu1nhw5-PdtxZ2U=PA5uq7VTrgW-W8boh29JRHxSVTyg@mail.gmail.com>
 <7f39388b-1689-c40a-9e2f-861408dae7b8@redhat.com>
In-Reply-To: <7f39388b-1689-c40a-9e2f-861408dae7b8@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

On 3/31/23 10:44, Paolo Bonzini wrote:
>>
>>     What about using a dataclass or namedtuple instead of a dictionary?
>>
>>
>> Sure. Once 3.8 is our minimum there's no point, though.
> 
> Well, that's why I also mentioned namedtuples.  But no big deal.

Sorry, I misunderstood this (I read "until 3.8 is our minimum" and 
interpreted that as "dataclasses are not in 3.6").

I agree, not much need to future-proof the <=3.7 parts of the code.

Paolo


