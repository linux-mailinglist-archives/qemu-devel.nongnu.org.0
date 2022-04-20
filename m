Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A32A5081F7
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 09:22:45 +0200 (CEST)
Received: from localhost ([::1]:39486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh4fk-0004EW-2k
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 03:22:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nh4eA-000382-1R
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 03:21:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nh4e5-00029Z-3s
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 03:21:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650439259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HC6CKpTpHqM9zX18HIpnKMJKm9/c2uMsVZgQw0q+ku0=;
 b=dKmtkO5cY4QIZqnNn7UMOnIm6f2EzwhoQiLGVpk31eu8nYLen+G4gFFRBSXARJ4T7eNyWY
 wcQRCNJAscYnzTBBjuExGxB+IllaLxIXN6c1VwcGrHRuLVPXQtfKhAyFDoteCHMiYcUKyC
 ecLUmUAqr3SuOdw53IWPzC2aL0itx5U=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-h9vAWcSENDyvjvgBQukBRQ-1; Wed, 20 Apr 2022 03:20:58 -0400
X-MC-Unique: h9vAWcSENDyvjvgBQukBRQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 cb11-20020a0564020b6b00b0041d870f7b3aso617296edb.11
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 00:20:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HC6CKpTpHqM9zX18HIpnKMJKm9/c2uMsVZgQw0q+ku0=;
 b=cjzi9VxoPklzPAcglpUe+fiDXevd5kcqaG3QxJFAUXk+FJH+vyCywVr3U7tz3WZ/Vk
 P8ZXid/7BZMDxFNE+87seNygjMhaZ645LnrhrRqHgf00thlUZrTgRO7JrjydCFS5QCDy
 E28y7mflKOrBXnYJEQTdHCcBjJukQWRXY0iuqZ0kxMVQDY50/JH7vYlLQXzODpAi6qD/
 goGEf5WnJVjTvnVPnpJ5UmW5UP9d0MbGe7OUvUgVsWiBBahzZGjsxr55ZosTJLwu5CK/
 GF5yI88dpaMOXCVveHCWO7Pav1tVZPCu471dBlA1IW6nCIKWu0wkdTK6/NdXtWf6X8+7
 aB5w==
X-Gm-Message-State: AOAM530hjkmPCX45+BNDK5QoCMDlFDUgYEoqD+jvBxKcnuh/NoLWzNyZ
 GeRZx/vfthOkHYN7Y1LNIil6LQESIljCxb1mTlvwr9BNxPN8ATyLjGTAMrqM/5sk1sGqEdTgFRs
 u2PnbSd5JrHIHEXc=
X-Received: by 2002:aa7:df92:0:b0:41d:84fd:5d92 with SMTP id
 b18-20020aa7df92000000b0041d84fd5d92mr21607696edy.337.1650439256520; 
 Wed, 20 Apr 2022 00:20:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2qykuB5EC2QeClkyQQgypKYuqCgYiIW5oSspWoB9DbRSQuAySs2L3p9hgk4l43OdPNHA5Xg==
X-Received: by 2002:aa7:df92:0:b0:41d:84fd:5d92 with SMTP id
 b18-20020aa7df92000000b0041d84fd5d92mr21607656edy.337.1650439255967; 
 Wed, 20 Apr 2022 00:20:55 -0700 (PDT)
Received: from [192.168.8.102]
 (dynamic-046-114-174-058.46.114.pool.telefonica.de. [46.114.174.58])
 by smtp.gmail.com with ESMTPSA id
 g23-20020a170906199700b006e874c0f5eesm6366769ejd.198.2022.04.20.00.20.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 00:20:54 -0700 (PDT)
Message-ID: <a3497b04-a11a-3981-f044-50ba94182eda@redhat.com>
Date: Wed, 20 Apr 2022 09:20:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] docs/ccid: convert to restructuredText
Content-Language: en-US
To: Damien Hedde <damien.hedde@greensocs.com>, oxr463@gmx.us,
 qemu-devel@nongnu.org
References: <20220405142906.21382-1-oxr463@gmx.us>
 <4aa036b5-e1c0-e7bf-3213-0ca1322042d5@greensocs.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <4aa036b5-e1c0-e7bf-3213-0ca1322042d5@greensocs.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: peter.maydell@linaro.org, Lucas Ramage <lucas.ramage@infinite-omicron.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/04/2022 17.37, Damien Hedde wrote:
> 
> 
> On 4/5/22 16:29, oxr463@gmx.us wrote:
>> From: Lucas Ramage <lucas.ramage@infinite-omicron.com>
>>
>> Buglink: https://gitlab.com/qemu-project/qemu/-/issues/527
>> Signed-off-by: Lucas Ramage <lucas.ramage@infinite-omicron.com>
> 
> Provided 2 minors tweaks (see below: missing empty line, and empty line at 
> EOF),
> Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
> 
> Note that I'm not competent regarding the content of this doc. But it 
> corresponds to the previous version and the doc generation works.

CCID is also not really my turf, but I can take it through my tree if nobody 
else wants to take it (and make the two suggested corrections while picking 
it up).

  Thomas


>> ---
>>   docs/ccid.txt                    | 182 -------------------------------
>>   docs/system/device-emulation.rst |   1 +
>>   docs/system/devices/ccid.rst     | 171 +++++++++++++++++++++++++++++
>>   3 files changed, 172 insertions(+), 182 deletions(-)
>>   delete mode 100644 docs/ccid.txt
>>   create mode 100644 docs/system/devices/ccid.rst
>>
>> diff --git a/docs/ccid.txt b/docs/ccid.txt
>> deleted file mode 100644
>> index 2b85b1bd42..0000000000
>> --- a/docs/ccid.txt
>> +++ /dev/null
>> @@ -1,182 +0,0 @@
>> -QEMU CCID Device Documentation.
>> -
>> -Contents
>> -1. USB CCID device
>> -2. Building
>> -3. Using ccid-card-emulated with hardware
>> -4. Using ccid-card-emulated with certificates
>> -5. Using ccid-card-passthru with client side hardware
>> -6. Using ccid-card-passthru with client side certificates
>> -7. Passthrough protocol scenario
>> -8. libcacard
>> -
>> -1. USB CCID device
>> -
>> -The USB CCID device is a USB device implementing the CCID specification, 
>> which
>> -lets one connect smart card readers that implement the same spec. For more
>> -information see the specification:
>> -
>> - Universal Serial Bus
>> - Device Class: Smart Card
>> - CCID
>> - Specification for
>> - Integrated Circuit(s) Cards Interface Devices
>> - Revision 1.1
>> - April 22rd, 2005
>> -
>> -Smartcards are used for authentication, single sign on, decryption in
>> -public/private schemes and digital signatures. A smartcard reader on the 
>> client
>> -cannot be used on a guest with simple usb passthrough since it will then 
>> not be
>> -available on the client, possibly locking the computer when it is 
>> "removed". On
>> -the other hand this device can let you use the smartcard on both the 
>> client and
>> -the guest machine. It is also possible to have a completely virtual smart 
>> card
>> -reader and smart card (i.e. not backed by a physical device) using this 
>> device.
>> -
>> -2. Building
>> -
>> -The cryptographic functions and access to the physical card is done via the
>> -libcacard library, whose development package must be installed prior to
>> -building QEMU:
>> -
>> -In redhat/fedora:
>> -    yum install libcacard-devel
>> -In ubuntu:
>> -    apt-get install libcacard-dev
>> -
>> -Configuring and building:
>> -    ./configure --enable-smartcard && make
>> -
>> -
>> -3. Using ccid-card-emulated with hardware
>> -
>> -Assuming you have a working smartcard on the host with the current
>> -user, using libcacard, QEMU acts as another client using ccid-card-emulated:
>> -
>> -    qemu -usb -device usb-ccid -device ccid-card-emulated
>> -
>> -
>> -4. Using ccid-card-emulated with certificates stored in files
>> -
>> -You must create the CA and card certificates. This is a one time process.
>> -We use NSS certificates:
>> -
>> -    mkdir fake-smartcard
>> -    cd fake-smartcard
>> -    certutil -N -d sql:$PWD
>> -    certutil -S -d sql:$PWD -s "CN=Fake Smart Card CA" -x -t TC,TC,TC -n 
>> fake-smartcard-ca
>> -    certutil -S -d sql:$PWD -t ,, -s "CN=John Doe" -n id-cert -c 
>> fake-smartcard-ca
>> -    certutil -S -d sql:$PWD -t ,, -s "CN=John Doe (signing)" --nsCertType 
>> smime -n signing-cert -c fake-smartcard-ca
>> -    certutil -S -d sql:$PWD -t ,, -s "CN=John Doe (encryption)" 
>> --nsCertType sslClient -n encryption-cert -c fake-smartcard-ca
>> -
>> -Note: you must have exactly three certificates.
>> -
>> -You can use the emulated card type with the certificates backend:
>> -
>> -    qemu -usb -device usb-ccid -device 
>> ccid-card-emulated,backend=certificates,db=sql:$PWD,cert1=id-cert,cert2=signing-cert,cert3=encryption-cert 
>>
>> -
>> -To use the certificates in the guest, export the CA certificate:
>> -
>> -    certutil -L -r -d sql:$PWD -o fake-smartcard-ca.cer -n fake-smartcard-ca
>> -
>> -and import it in the guest:
>> -
>> -    certutil -A -d /etc/pki/nssdb -i fake-smartcard-ca.cer -t TC,TC,TC -n 
>> fake-smartcard-ca
>> -
>> -In a Linux guest you can then use the CoolKey PKCS #11 module to access
>> -the card:
>> -
>> -    certutil -d /etc/pki/nssdb -L -h all
>> -
>> -It will prompt you for the PIN (which is the password you assigned to the
>> -certificate database early on), and then show you all three certificates
>> -together with the manually imported CA cert:
>> -
>> -    Certificate Nickname                        Trust Attributes
>> -    fake-smartcard-ca                           CT,C,C
>> -    John Doe:CAC ID Certificate                 u,u,u
>> -    John Doe:CAC Email Signature Certificate    u,u,u
>> -    John Doe:CAC Email Encryption Certificate   u,u,u
>> -
>> -If this does not happen, CoolKey is not installed or not registered with
>> -NSS.  Registration can be done from Firefox or the command line:
>> -
>> -    modutil -dbdir /etc/pki/nssdb -add "CAC Module" -libfile 
>> /usr/lib64/pkcs11/libcoolkeypk11.so
>> -    modutil -dbdir /etc/pki/nssdb -list
>> -
>> -
>> -5. Using ccid-card-passthru with client side hardware
>> -
>> -on the host specify the ccid-card-passthru device with a suitable chardev:
>> -
>> -    qemu -chardev socket,server=on,host=0.0.0.0,port=2001,id=ccid,wait=off \
>> -         -usb -device usb-ccid -device ccid-card-passthru,chardev=ccid
>> -
>> -on the client run vscclient, built when you built QEMU:
>> -
>> -    vscclient <qemu-host> 2001
>> -
>> -
>> -6. Using ccid-card-passthru with client side certificates
>> -
>> -This case is not particularly useful, but you can use it to debug
>> -your setup if #4 works but #5 does not.
>> -
>> -Follow instructions as per #4, except run QEMU and vscclient as follows:
>> -Run qemu as per #5, and run vscclient from the "fake-smartcard"
>> -directory as follows:
>> -
>> -    qemu -chardev socket,server=on,host=0.0.0.0,port=2001,id=ccid,wait=off \
>> -         -usb -device usb-ccid -device ccid-card-passthru,chardev=ccid
>> -    vscclient -e "db=\"sql:$PWD\" use_hw=no 
>> soft=(,Test,CAC,,id-cert,signing-cert,encryption-cert)" <qemu-host> 2001
>> -
>> -
>> -7. Passthrough protocol scenario
>> -
>> -This is a typical interchange of messages when using the passthru card 
>> device.
>> -usb-ccid is a usb device. It defaults to an unattached usb device on 
>> startup.
>> -usb-ccid expects a chardev and expects the protocol defined in
>> -cac_card/vscard_common.h to be passed over that.
>> -The usb-ccid device can be in one of three modes:
>> - * detached
>> - * attached with no card
>> - * attached with card
>> -
>> -A typical interchange is: (the arrow shows who started each exchange, it 
>> can be client
>> -originated or guest originated)
>> -
>> -client event      |      vscclient           |    passthru    |     
>> usb-ccid  |  guest event
>> ----------------------------------------------------------------------------------------------- 
>>
>> -                  |      VSC_Init            |                
>> |               |
>> -                  |      VSC_ReaderAdd       |                |     
>> attach    |
>> -                  |                          |                
>> |               |  sees new usb device.
>> -card inserted ->  |                          |                
>> |               |
>> -                  |      VSC_ATR             |   insert       |     
>> insert    |  see new card
>> -                  |                          |                
>> |               |
>> -                  |      VSC_APDU            |   VSC_APDU     
>> |               | <- guest sends APDU
>> -client<->physical |                          |                
>> |               |
>> -card APDU exchange|                          |                
>> |               |
>> -client response ->|      VSC_APDU            |   VSC_APDU     
>> |               |  receive APDU response
>> -                                                    ...
>> -                                    [APDU<->APDU repeats several times]
>> -                                                    ...
>> -card removed  ->  |                          |                
>> |               |
>> -                  |      VSC_CardRemove      |   remove       |    
>> remove     |   card removed
>> -                                                    ...
>> -                                    [(card insert, apdu's, card remove) 
>> repeat]
>> -                                                    ...
>> -kill/quit         |                          |                
>> |               |
>> -  vscclient       |                          |                
>> |               |
>> -                  |      VSC_ReaderRemove    |                |    
>> detach     |
>> -                  |                          |                
>> |               |   usb device removed.
>> -
>> -
>> -8. libcacard
>> -
>> -Both ccid-card-emulated and vscclient use libcacard as the card emulator.
>> -libcacard implements a completely virtual CAC (DoD standard for smart
>> -cards) compliant card and uses NSS to retrieve certificates and do
>> -any encryption.  The backend can then be a real reader and card, or
>> -certificates stored in files.
>> -
>> -For documentation of the library see docs/libcacard.txt.
>> -
>> diff --git a/docs/system/device-emulation.rst 
>> b/docs/system/device-emulation.rst
>> index 0b3a3d73ad..ae8dd233e8 100644
>> --- a/docs/system/device-emulation.rst
>> +++ b/docs/system/device-emulation.rst
>> @@ -83,6 +83,7 @@ Emulated Devices
>>      :maxdepth: 1
>>
>>      devices/can.rst
>> +   devices/ccid.rst
>>      devices/ivshmem.rst
>>      devices/net.rst
>>      devices/nvme.rst
>> diff --git a/docs/system/devices/ccid.rst b/docs/system/devices/ccid.rst
>> new file mode 100644
>> index 0000000000..0290265a18
>> --- /dev/null
>> +++ b/docs/system/devices/ccid.rst
>> @@ -0,0 +1,171 @@
>> +Chip Card Interface Device (CCID)
>> +=================================
>> +
>> +USB CCID device
>> +---------------
>> +The USB CCID device is a USB device implementing the CCID specification, 
>> which
>> +lets one connect smart card readers that implement the same spec. For more
>> +information see the specification::
>> +
>> +  Universal Serial Bus
>> +  Device Class: Smart Card
>> +  CCID
>> +  Specification for
>> +  Integrated Circuit(s) Cards Interface Devices
>> +  Revision 1.1
>> +  April 22rd, 2005
>> +
>> +Smartcards are used for authentication, single sign on, decryption in
>> +public/private schemes and digital signatures. A smartcard reader on the 
>> client
>> +cannot be used on a guest with simple usb passthrough since it will then 
>> not be
>> +available on the client, possibly locking the computer when it is 
>> "removed". On
>> +the other hand this device can let you use the smartcard on both the 
>> client and
>> +the guest machine. It is also possible to have a completely virtual smart 
>> card
>> +reader and smart card (i.e. not backed by a physical device) using this 
>> device.
>> +
>> +Building
>> +--------
>> +The cryptographic functions and access to the physical card is done via the
>> +libcacard library, whose development package must be installed prior to
>> +building QEMU:
>> +
>> +In redhat/fedora::
>> +
>> +  yum install libcacard-devel
>> +
>> +In ubuntu::
>> +
>> +  apt-get install libcacard-dev
>> +
>> +Configuring and building::
>> +
>> +  ./configure --enable-smartcard && make
>> +
>> +Using ccid-card-emulated with hardware
>> +--------------------------------------
>> +Assuming you have a working smartcard on the host with the current
>> +user, using libcacard, QEMU acts as another client using 
>> ccid-card-emulated::
>> +
>> +  qemu -usb -device usb-ccid -device ccid-card-emulated
>> +
>> +Using ccid-card-emulated with certificates stored in files
>> +----------------------------------------------------------
>> +You must create the CA and card certificates. This is a one time process.
>> +We use NSS certificates::
>> +
>> +  mkdir fake-smartcard
>> +  cd fake-smartcard
>> +  certutil -N -d sql:$PWD
>> +  certutil -S -d sql:$PWD -s "CN=Fake Smart Card CA" -x -t TC,TC,TC -n 
>> fake-smartcard-ca
>> +  certutil -S -d sql:$PWD -t ,, -s "CN=John Doe" -n id-cert -c 
>> fake-smartcard-ca
>> +  certutil -S -d sql:$PWD -t ,, -s "CN=John Doe (signing)" --nsCertType 
>> smime -n signing-cert -c fake-smartcard-ca
>> +  certutil -S -d sql:$PWD -t ,, -s "CN=John Doe (encryption)" 
>> --nsCertType sslClient -n encryption-cert -c fake-smartcard-ca
>> +
>> +Note: you must have exactly three certificates.
>> +
>> +You can use the emulated card type with the certificates backend::
>> +
>> +  qemu -usb -device usb-ccid -device 
>> ccid-card-emulated,backend=certificates,db=sql:$PWD,cert1=id-cert,cert2=signing-cert,cert3=encryption-cert 
>>
>> +
>> +To use the certificates in the guest, export the CA certificate::
>> +
>> +  certutil -L -r -d sql:$PWD -o fake-smartcard-ca.cer -n fake-smartcard-ca
>> +
>> +and import it in the guest::
>> +
>> +  certutil -A -d /etc/pki/nssdb -i fake-smartcard-ca.cer -t TC,TC,TC -n 
>> fake-smartcard-ca
>> +
>> +In a Linux guest you can then use the CoolKey PKCS #11 module to access
>> +the card::
>> +
>> +  certutil -d /etc/pki/nssdb -L -h all
>> +
>> +It will prompt you for the PIN (which is the password you assigned to the
>> +certificate database early on), and then show you all three certificates
>> +together with the manually imported CA cert::
>> +
>> +  Certificate Nickname                        Trust Attributes
>> +  fake-smartcard-ca                           CT,C,C
>> +  John Doe:CAC ID Certificate                 u,u,u
>> +  John Doe:CAC Email Signature Certificate    u,u,u
>> +  John Doe:CAC Email Encryption Certificate   u,u,u
>> +
>> +If this does not happen, CoolKey is not installed or not registered with
>> +NSS. Registration can be done from Firefox or the command line::
>> +
>> +  modutil -dbdir /etc/pki/nssdb -add "CAC Module" -libfile 
>> /usr/lib64/pkcs11/libcoolkeypk11.so
>> +  modutil -dbdir /etc/pki/nssdb -list
>> +
>> +Using ccid-card-passthru with client side hardware
>> +--------------------------------------------------
>> +On the host specify the ccid-card-passthru device with a suitable chardev::
>> +
>> +  qemu -chardev socket,server=on,host=0.0.0.0,port=2001,id=ccid,wait=off \
>> +       -usb -device usb-ccid -device ccid-card-passthru,chardev=ccid
>> +
>> +On the client run vscclient, built when you built QEMU::
>> +
>> +  vscclient <qemu-host> 2001
>> +
>> +Using ccid-card-passthru with client side certificates
>> +------------------------------------------------------
>> +This case is not particularly useful, but you can use it to debug
>> +your setup.
>> +
>> +Follow instructions above, except run QEMU and vscclient as follows.
>> +
>> +Run qemu as per above, and run vscclient from the "fake-smartcard"
>> +directory as follows::
>> +
>> +  qemu -chardev socket,server=on,host=0.0.0.0,port=2001,id=ccid,wait=off \
>> +       -usb -device usb-ccid -device ccid-card-passthru,chardev=ccid
>> +  vscclient -e "db=\"sql:$PWD\" use_hw=no 
>> soft=(,Test,CAC,,id-cert,signing-cert,encryption-cert)" <qemu-host> 2001
>> +
>> +
>> +Passthrough protocol scenario
>> +-----------------------------
>> +This is a typical interchange of messages when using the passthru card 
>> device.
>> +usb-ccid is a usb device. It defaults to an unattached usb device on 
>> startup.
>> +usb-ccid expects a chardev and expects the protocol defined in
>> +cac_card/vscard_common.h to be passed over that.
>> +The usb-ccid device can be in one of three modes:
> 
> Empty line missing here, so that the bullet list below works.
> 
>> +* detached
>> +* attached with no card
>> +* attached with card > +
>> +A typical interchange is (the arrow shows who started each exchange, it 
>> can be client
>> +originated or guest originated)::
>> +
>> +  client event        |      vscclient           |    passthru    |     
>> usb-ccid  |  guest event
>> +  
>> ------------------------------------------------------------------------------------------------ 
>>
>> +                      |      VSC_Init            |                
>> |               |
>> +                      |      VSC_ReaderAdd       |                |     
>> attach    |
>> +                      |                          |                
>> |               |  sees new usb device.
>> +    card inserted ->  |                          |                
>> |               |
>> +                      |      VSC_ATR             |   insert       |     
>> insert    |  see new card
>> +                      |                          |                
>> |               |
>> +                      |      VSC_APDU            |   VSC_APDU     
>> |               | <- guest sends APDU
>> +  client <-> physical |                          |                
>> |               |
>> +   card APDU exchange |                          |                
>> |               |
>> +   client response -> |      VSC_APDU            |   VSC_APDU     
>> |               |  receive APDU response
>> +                                                        ...
>> +                                        [APDU<->APDU repeats several times]
>> +                                                        ...
>> +     card removed  -> |                          |                
>> |               |
>> +                      |      VSC_CardRemove      |   remove       |    
>> remove     |   card removed
>> +                                                        ...
>> +                                        [(card insert, apdu's, card 
>> remove) repeat]
>> +                                                        ...
>> +    kill/quit         |                          |                
>> |               |
>> +      vscclient       |                          |                
>> |               |
>> +                      |      VSC_ReaderRemove    |                |    
>> detach     |
>> +                      |                          |                
>> |               |   usb device removed.
>> +
>> +libcacard
>> +---------
>> +Both ccid-card-emulated and vscclient use libcacard as the card emulator.
>> +libcacard implements a completely virtual CAC (DoD standard for smart
>> +cards) compliant card and uses NSS to retrieve certificates and do
>> +any encryption. The backend can then be a real reader and card, or
>> +certificates stored in files.
>> +
> 
> Empty line at end of line should be removed I think.
> 
>> -- 
>> 2.34.1
>>
>>
> 
> Regards,
> -- 
> Damien
> 


