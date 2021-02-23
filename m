Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9E53230B0
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 19:27:13 +0100 (CET)
Received: from localhost ([::1]:51490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEcOu-00015G-Uo
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 13:27:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lEcMX-0007aC-HK
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 13:24:45 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:40675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lEcMU-0006nj-8t
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 13:24:45 -0500
Received: by mail-wm1-x32a.google.com with SMTP id l13so3332482wmg.5
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 10:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=z6CcBSADZOSb/oBF4pE8o2Qr9PGeyKjYqKw19IdfySU=;
 b=rfhU6reVXd/XNpyYK4h5KRKZxuFtqRaxj5CGdNNqZaHfmLMpYs2fVtWtOiKIQl0zH7
 7lwf1MEis8vxK9msB26PVwN2KHpl6G+7w+VkYsQe/0vLgrEweUgYxGmtFI8XT+SLy4I9
 23vJxGrQjilrGqEbqkN7HHK/ASIeT9HaKSziqHsHvPSpVdSehYN3LU2pB4tb0GwOqzFi
 NcMfDipjsicNSFYo/UwfJwNoF/k3WpmPAgWJ1A842gtIfefxT+Ex6FRDLrpXUsI3xLSD
 IE8ljQw5ajbhD8pWECMEswx6SXiO9IiVgXCIjxsH4oOClbk7QFILPkxn2yazU3stAric
 XePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=z6CcBSADZOSb/oBF4pE8o2Qr9PGeyKjYqKw19IdfySU=;
 b=GwE0t8ATGoKkCoy2LATK3tAI/gZxccakmiXs2SiOdNLbsrdzApM64I7NZg96+drva0
 tu4xV+WdOUtq68t73UnipUavECWfrcmoSFHMQjmnlorF4x1YSR+j/GBJKE3+aDV5Vm+F
 p1frGsYzt0ZZiVOmT2Ka04rpIfpeQQCEDMMDZlZkQ7o/4bNLouQgdq6TrilPEPi+q/3g
 4P1JhRqH3nODiSHabTdduEEUH+szXbSGZWOEf0D9rarbijdFrJasmDSkk0O9V6TfdS+w
 VJr9/fgvCdYi4/ci+paozBa9qfvy7V1UsOYgOPEI23pDqNahKaGFz2Bls3kpthdFp5MI
 GbRg==
X-Gm-Message-State: AOAM531zfL5HWOpIenVW7kMCuWwjqAFq9bXJzUC26l62mO6CAX7uP60l
 tWnuF/m5c6GhXsLKR+RuTHgASw==
X-Google-Smtp-Source: ABdhPJx652PUMa+msm2EBCL9yGWoT6aJu2uW3G65JQX73fP+CoIR64JzEQTaxs4dyZPXQNoUYWOubQ==
X-Received: by 2002:a05:600c:4fd5:: with SMTP id
 o21mr92515wmq.20.1614104680559; 
 Tue, 23 Feb 2021 10:24:40 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n1sm6615644wrx.45.2021.02.23.10.24.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 10:24:39 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A49C51FF7E;
 Tue, 23 Feb 2021 18:24:38 +0000 (GMT)
References: <20210219215838.752547-1-crosa@redhat.com>
 <20210219215838.752547-3-crosa@redhat.com> <87im6i4znx.fsf@linaro.org>
 <87ft1m4yjw.fsf@linaro.org> <20210223174431.GE987581@amachine.somewhere>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH v5 2/4] Jobs based on custom runners: build environment
 docs and playbook
Date: Tue, 23 Feb 2021 18:23:25 +0000
In-reply-to: <20210223174431.GE987581@amachine.somewhere>
Message-ID: <87v9ai3amx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, Andrea Bolognani <abologna@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Willian Rampazzo <wrampazz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud?= =?utf-8?Q?=C3=A9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Cleber Rosa <crosa@redhat.com> writes:

> On Tue, Feb 23, 2021 at 03:01:50PM +0000, Alex Benn=C3=A9e wrote:
>>=20
>> Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
>>=20
>> > Cleber Rosa <crosa@redhat.com> writes:
>> >
>> >> To run basic jobs on custom runners, the environment needs to be
>> >> properly set up.  The most common requirement is having the right
>> >> packages installed.
>> >>
>> <snip>
>> >
>> > So I got somewhat there with a direct command line invocation:
>> >
>> >   ansible-playbook -u root -i 192.168.122.24,192.168.122.45 scripts/ci=
/setup/build-environment.yml -e 'ansible_python_interpreter=3D/usr/bin/pyth=
on3'
>> >
>> > although for some reason a single host -i fails...
>> >
>> >> diff --git a/scripts/ci/setup/build-environment.yml b/scripts/ci/setu=
p/build-environment.yml
>> >> new file mode 100644
>> >> index 0000000000..0197e0a48b
>> >> --- /dev/null
>> >> +++ b/scripts/ci/setup/build-environment.yml
>> >> @@ -0,0 +1,76 @@
>> >> +---
>> >> +- name: Installation of basic packages to build QEMU
>> >> +  hosts: all
>> >> +  tasks:
>> >> +    - name: Update apt cache
>> >> +      apt:
>> >> +        update_cache: yes
>> >> +      when:
>> >> +        - ansible_facts['distribution'] =3D=3D 'Ubuntu'
>> >
>> > So are we limiting to Ubuntu here rather than say a Debian base?
>>=20
>> Also I'm getting:
>>=20
>>   TASK [Update apt cache] **********************************************=
***************************************************************************=
****************************
>>   fatal: [hackbox-ubuntu-2004]: FAILED! =3D> {"msg": "The conditional ch=
eck 'ansible_facts['distribution'] =3D=3D 'Ubuntu'' failed. The error was: =
error while evaluating conditional (ansible_facts['distribution'] =3D=3D 'U=
buntu'): 'dict object' has no attribute 'distribution'\n\nThe error appears=
 to have been in '/home/alex/lsrc/qemu.git/scripts/ci/setup/build-environme=
nt.yml': line 5, column 7, but may\nbe elsewhere in the file depending on t=
he exact syntax problem.\n\nThe offending line appears to be:\n\n  tasks:\n=
    - name: Update apt cache\n      ^ here\n"}
>>=20
>> which is odd given that machine is definitely an Ubuntu one.
>>
>
> It's defintely odd.  This is what I get on a fresh machine:
>
>    TASK [Update apt cache] **********************************************=
***************************************************************************
>    [WARNING]: Updating cache and auto-installing missing dependency: pyth=
on3-apt
>    ok: [localhost]
>
> Could you please let me know the output of:
>
>    $ ansible -m setup -u $YOUR_USERNAME -i $HOSTNAME, all | grep
>    ansible_distribution

The key doesn't exist:

hackbox-ubuntu-2004 | SUCCESS =3D> {
    "ansible_facts": {
        "ansible_all_ipv4_addresses": [
            "192.168.122.170"
        ],
        "ansible_all_ipv6_addresses": [
            "fe80::5054:ff:fe54:7cfe"
        ],
        "ansible_apparmor": {
            "status": "enabled"
        },
        "ansible_architecture": "x86_64",
        "ansible_bios_date": "04/01/2014",
        "ansible_bios_version": "1.10.2-1ubuntu1",
        "ansible_cmdline": {
            "BOOT_IMAGE": "/vmlinuz-5.4.0-65-generic",
            "maybe-ubiquity": true,
            "ro": true,
            "root": "/dev/mapper/ubuntu--vg-ubuntu--lv"
        },
        "ansible_date_time": {
            "date": "2021-02-23",
            "day": "23",
            "epoch": "1614104601",
            "hour": "18",
            "iso8601": "2021-02-23T18:23:21Z",
            "iso8601_basic": "20210223T182321857461",
            "iso8601_basic_short": "20210223T182321",
            "iso8601_micro": "2021-02-23T18:23:21.857529Z",
            "minute": "23",
            "month": "02",
            "second": "21",
            "time": "18:23:21",
            "tz": "UTC",
            "tz_offset": "+0000",
            "weekday": "Tuesday",
            "weekday_number": "2",
            "weeknumber": "08",
            "year": "2021"
        },
        "ansible_default_ipv4": {
            "address": "192.168.122.170",
            "alias": "enp1s0",
            "broadcast": "192.168.122.255",
            "gateway": "192.168.122.1",
            "interface": "enp1s0",
            "macaddress": "52:54:00:54:7c:fe",
            "mtu": 1500,
            "netmask": "255.255.255.0",
            "network": "192.168.122.0",
            "type": "ether"
        },
        "ansible_default_ipv6": {},
        "ansible_device_links": {
            "ids": {
                "dm-0": [
                    "dm-name-ubuntu--vg-ubuntu--lv",
                    "dm-uuid-LVM-filR1BfuX6Mpp9J7CP9cbVsTT2ICh7Apc9qZsFohns=
qycocacS0Sm6HAhjTBEAkq"
                ],
                "sda": [
                    "scsi-0QEMU_QEMU_HARDDISK_drive-scsi0-0-1"
                ],
                "sda1": [
                    "scsi-0QEMU_QEMU_HARDDISK_drive-scsi0-0-1-part1"
                ],
                "sda2": [
                    "scsi-0QEMU_QEMU_HARDDISK_drive-scsi0-0-1-part2"
                ],
                "sda3": [
                    "lvm-pv-uuid-agDdyQ-V5gQ-aaov-933l-SFAL-0rmD-SlOkYy",
                    "scsi-0QEMU_QEMU_HARDDISK_drive-scsi0-0-1-part3"
                ],
                "sr0": [
                    "ata-QEMU_DVD-ROM_QM00001"
                ]
            },
            "labels": {},
            "masters": {
                "sda3": [
                    "dm-0"
                ]
            },
            "uuids": {
                "dm-0": [
                    "291656fe-bd87-484c-b4a9-4453471a17e8"
                ],
                "sda2": [
                    "45018994-9625-44ad-877a-3980bcf943a3"
                ]
            }
        },
        "ansible_devices": {
            "dm-0": {
                "holders": [],
                "host": "",
                "links": {
                    "ids": [
                        "dm-name-ubuntu--vg-ubuntu--lv",
                        "dm-uuid-LVM-filR1BfuX6Mpp9J7CP9cbVsTT2ICh7Apc9qZsF=
ohnsqycocacS0Sm6HAhjTBEAkq"
                    ],
                    "labels": [],
                    "masters": [],
                    "uuids": [
                        "291656fe-bd87-484c-b4a9-4453471a17e8"
                    ]
                },
                "model": null,
                "partitions": {},
                "removable": "0",
                "rotational": "1",
                "sas_address": null,
                "sas_device_handle": null,
                "scheduler_mode": "",
                "sectors": "41943040",
                "sectorsize": "512",
                "size": "20.00 GB",
                "support_discard": "4096",
                "vendor": null,
                "virtual": 1
            },
            "loop0": {
                "holders": [],
                "host": "",
                "links": {
                    "ids": [],
                    "labels": [],
                    "masters": [],
                    "uuids": []
                },
                "model": null,
                "partitions": {},
                "removable": "0",
                "rotational": "1",
                "sas_address": null,
                "sas_device_handle": null,
                "scheduler_mode": "mq-deadline",
                "sectors": "143120",
                "sectorsize": "512",
                "size": "69.88 MB",
                "support_discard": "4096",
                "vendor": null,
                "virtual": 1
            },
            "loop1": {
                "holders": [],
                "host": "",
                "links": {
                    "ids": [],
                    "labels": [],
                    "masters": [],
                    "uuids": []
                },
                "model": null,
                "partitions": {},
                "removable": "0",
                "rotational": "1",
                "sas_address": null,
                "sas_device_handle": null,
                "scheduler_mode": "mq-deadline",
                "sectors": "0",
                "sectorsize": "512",
                "size": "0.00 Bytes",
                "support_discard": "4096",
                "vendor": null,
                "virtual": 1
            },
            "loop2": {
                "holders": [],
                "host": "",
                "links": {
                    "ids": [],
                    "labels": [],
                    "masters": [],
                    "uuids": []
                },
                "model": null,
                "partitions": {},
                "removable": "0",
                "rotational": "1",
                "sas_address": null,
                "sas_device_handle": null,
                "scheduler_mode": "mq-deadline",
                "sectors": "0",
                "sectorsize": "512",
                "size": "0.00 Bytes",
                "support_discard": "4096",
                "vendor": null,
                "virtual": 1
            },
            "loop3": {
                "holders": [],
                "host": "",
                "links": {
                    "ids": [],
                    "labels": [],
                    "masters": [],
                    "uuids": []
                },
                "model": null,
                "partitions": {},
                "removable": "0",
                "rotational": "1",
                "sas_address": null,
                "sas_device_handle": null,
                "scheduler_mode": "mq-deadline",
                "sectors": "113424",
                "sectorsize": "512",
                "size": "55.38 MB",
                "support_discard": "4096",
                "vendor": null,
                "virtual": 1
            },
            "loop4": {
                "holders": [],
                "host": "",
                "links": {
                    "ids": [],
                    "labels": [],
                    "masters": [],
                    "uuids": []
                },
                "model": null,
                "partitions": {},
                "removable": "0",
                "rotational": "1",
                "sas_address": null,
                "sas_device_handle": null,
                "scheduler_mode": "mq-deadline",
                "sectors": "63672",
                "sectorsize": "512",
                "size": "31.09 MB",
                "support_discard": "4096",
                "vendor": null,
                "virtual": 1
            },
            "loop5": {
                "holders": [],
                "host": "",
                "links": {
                    "ids": [],
                    "labels": [],
                    "masters": [],
                    "uuids": []
                },
                "model": null,
                "partitions": {},
                "removable": "0",
                "rotational": "1",
                "sas_address": null,
                "sas_device_handle": null,
                "scheduler_mode": "mq-deadline",
                "sectors": "142872",
                "sectorsize": "512",
                "size": "69.76 MB",
                "support_discard": "4096",
                "vendor": null,
                "virtual": 1
            },
            "loop6": {
                "holders": [],
                "host": "",
                "links": {
                    "ids": [],
                    "labels": [],
                    "masters": [],
                    "uuids": []
                },
                "model": null,
                "partitions": {},
                "removable": "0",
                "rotational": "1",
                "sas_address": null,
                "sas_device_handle": null,
                "scheduler_mode": "mq-deadline",
                "sectors": "113592",
                "sectorsize": "512",
                "size": "55.46 MB",
                "support_discard": "4096",
                "vendor": null,
                "virtual": 1
            },
            "loop7": {
                "holders": [],
                "host": "",
                "links": {
                    "ids": [],
                    "labels": [],
                    "masters": [],
                    "uuids": []
                },
                "model": null,
                "partitions": {},
                "removable": "0",
                "rotational": "1",
                "sas_address": null,
                "sas_device_handle": null,
                "scheduler_mode": "mq-deadline",
                "sectors": "63664",
                "sectorsize": "512",
                "size": "31.09 MB",
                "support_discard": "4096",
                "vendor": null,
                "virtual": 1
            },
            "sda": {
                "holders": [],
                "host": "SCSI storage controller: Broadcom / LSI 53c895a",
                "links": {
                    "ids": [
                        "scsi-0QEMU_QEMU_HARDDISK_drive-scsi0-0-1"
                    ],
                    "labels": [],
                    "masters": [],
                    "uuids": []
                },
                "model": "QEMU HARDDISK",
                "partitions": {
                    "sda1": {
                        "holders": [],
                        "links": {
                            "ids": [
                                "scsi-0QEMU_QEMU_HARDDISK_drive-scsi0-0-1-p=
art1"
                            ],
                            "labels": [],
                            "masters": [],
                            "uuids": []
                        },
                        "sectors": "2048",
                        "sectorsize": 512,
                        "size": "1.00 MB",
                        "start": "2048",
                        "uuid": null
                    },
                    "sda2": {
                        "holders": [],
                        "links": {
                            "ids": [
                                "scsi-0QEMU_QEMU_HARDDISK_drive-scsi0-0-1-p=
art2"
                            ],
                            "labels": [],
                            "masters": [],
                            "uuids": [
                                "45018994-9625-44ad-877a-3980bcf943a3"
                            ]
                        },
                        "sectors": "2097152",
                        "sectorsize": 512,
                        "size": "1.00 GB",
                        "start": "4096",
                        "uuid": "45018994-9625-44ad-877a-3980bcf943a3"
                    },
                    "sda3": {
                        "holders": [
                            "ubuntu--vg-ubuntu--lv"
                        ],
                        "links": {
                            "ids": [
                                "lvm-pv-uuid-agDdyQ-V5gQ-aaov-933l-SFAL-0rm=
D-SlOkYy",
                                "scsi-0QEMU_QEMU_HARDDISK_drive-scsi0-0-1-p=
art3"
                            ],
                            "labels": [],
                            "masters": [
                                "dm-0"
                            ],
                            "uuids": []
                        },
                        "sectors": "81782784",
                        "sectorsize": 512,
                        "size": "39.00 GB",
                        "start": "2101248",
                        "uuid": null
                    }
                },
                "removable": "0",
                "rotational": "1",
                "sas_address": null,
                "sas_device_handle": null,
                "scheduler_mode": "mq-deadline",
                "sectors": "83886080",
                "sectorsize": "512",
                "size": "40.00 GB",
                "support_discard": "4096",
                "vendor": "QEMU",
                "virtual": 1
            },
            "sr0": {
                "holders": [],
                "host": "SATA controller: Intel Corporation 82801IR/IO/IH (=
ICH9R/DO/DH) 6 port SATA Controller [AHCI mode] (rev 02)",
                "links": {
                    "ids": [
                        "ata-QEMU_DVD-ROM_QM00001"
                    ],
                    "labels": [],
                    "masters": [],
                    "uuids": []
                },
                "model": "QEMU DVD-ROM",
                "partitions": {},
                "removable": "1",
                "rotational": "1",
                "sas_address": null,
                "sas_device_handle": null,
                "scheduler_mode": "mq-deadline",
                "sectors": "2097151",
                "sectorsize": "512",
                "size": "1024.00 MB",
                "support_discard": "0",
                "vendor": "QEMU",
                "virtual": 1
            }
        },
        "ansible_dns": {
            "nameservers": [
                "127.0.0.53"
            ],
            "options": {
                "edns0": true,
                "trust-ad": true
            }
        },
        "ansible_domain": "",
        "ansible_effective_group_id": 0,
        "ansible_effective_user_id": 0,
        "ansible_enp1s0": {
            "active": true,
            "device": "enp1s0",
            "features": {
                "esp_hw_offload": "off [fixed]",
                "esp_tx_csum_hw_offload": "off [fixed]",
                "fcoe_mtu": "off [fixed]",
                "generic_receive_offload": "on",
                "generic_segmentation_offload": "on",
                "highdma": "on [fixed]",
                "hw_tc_offload": "off [fixed]",
                "l2_fwd_offload": "off [fixed]",
                "large_receive_offload": "on",
                "loopback": "off [fixed]",
                "netns_local": "off [fixed]",
                "ntuple_filters": "off [fixed]",
                "receive_hashing": "off [fixed]",
                "rx_all": "off [fixed]",
                "rx_checksumming": "on [fixed]",
                "rx_fcs": "off [fixed]",
                "rx_gro_hw": "off [fixed]",
                "rx_udp_tunnel_port_offload": "off [fixed]",
                "rx_vlan_filter": "on [fixed]",
                "rx_vlan_offload": "off [fixed]",
                "rx_vlan_stag_filter": "off [fixed]",
                "rx_vlan_stag_hw_parse": "off [fixed]",
                "scatter_gather": "on",
                "tcp_segmentation_offload": "on",
                "tls_hw_record": "off [fixed]",
                "tls_hw_rx_offload": "off [fixed]",
                "tls_hw_tx_offload": "off [fixed]",
                "tx_checksum_fcoe_crc": "off [fixed]",
                "tx_checksum_ip_generic": "on",
                "tx_checksum_ipv4": "off [fixed]",
                "tx_checksum_ipv6": "off [fixed]",
                "tx_checksum_sctp": "off [fixed]",
                "tx_checksumming": "on",
                "tx_esp_segmentation": "off [fixed]",
                "tx_fcoe_segmentation": "off [fixed]",
                "tx_gre_csum_segmentation": "off [fixed]",
                "tx_gre_segmentation": "off [fixed]",
                "tx_gso_partial": "off [fixed]",
                "tx_gso_robust": "on [fixed]",
                "tx_ipxip4_segmentation": "off [fixed]",
                "tx_ipxip6_segmentation": "off [fixed]",
                "tx_lockless": "off [fixed]",
                "tx_nocache_copy": "off",
                "tx_scatter_gather": "on",
                "tx_scatter_gather_fraglist": "off [fixed]",
                "tx_sctp_segmentation": "off [fixed]",
                "tx_tcp6_segmentation": "on",
                "tx_tcp_ecn_segmentation": "on",
                "tx_tcp_mangleid_segmentation": "off",
                "tx_tcp_segmentation": "on",
                "tx_udp_segmentation": "off [fixed]",
                "tx_udp_tnl_csum_segmentation": "off [fixed]",
                "tx_udp_tnl_segmentation": "off [fixed]",
                "tx_vlan_offload": "off [fixed]",
                "tx_vlan_stag_hw_insert": "off [fixed]",
                "vlan_challenged": "off [fixed]"
            },
            "hw_timestamp_filters": [],
            "ipv4": {
                "address": "192.168.122.170",
                "broadcast": "192.168.122.255",
                "netmask": "255.255.255.0",
                "network": "192.168.122.0"
            },
            "ipv6": [
                {
                    "address": "fe80::5054:ff:fe54:7cfe",
                    "prefix": "64",
                    "scope": "link"
                }
            ],
            "macaddress": "52:54:00:54:7c:fe",
            "module": "virtio_net",
            "mtu": 1500,
            "pciid": "virtio0",
            "promisc": false,
            "speed": -1,
            "timestamping": [
                "tx_software",
                "rx_software",
                "software"
            ],
            "type": "ether"
        },
        "ansible_env": {
            "DBUS_SESSION_BUS_ADDRESS": "unix:path=3D/run/user/0/bus",
            "HOME": "/root",
            "LANG": "en_GB.UTF-8",
            "LOGNAME": "root",
            "MOTD_SHOWN": "pam",
            "PATH": "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbi=
n:/bin:/usr/games:/usr/local/games:/snap/bin",
            "PWD": "/root",
            "SHELL": "/bin/bash",
            "SHLVL": "0",
            "SSH_AUTH_SOCK": "/tmp/ssh-xGhYmKCci1/agent.4096",
            "SSH_CLIENT": "192.168.122.1 40374 22",
            "SSH_CONNECTION": "192.168.122.1 40374 192.168.122.170 22",
            "SSH_TTY": "/dev/pts/0",
            "TERM": "screen-256color",
            "USER": "root",
            "XDG_RUNTIME_DIR": "/run/user/0",
            "XDG_SESSION_CLASS": "user",
            "XDG_SESSION_ID": "17",
            "XDG_SESSION_TYPE": "tty",
            "_": "/bin/sh"
        },
        "ansible_fips": false,
        "ansible_form_factor": "Other",
        "ansible_fqdn": "ubuntu2004",
        "ansible_hostname": "ubuntu2004",
        "ansible_interfaces": [
            "enp1s0",
            "lo"
        ],
        "ansible_is_chroot": false,
        "ansible_iscsi_iqn": "iqn.1993-08.org.debian:01:af5bf2af245",
        "ansible_kernel": "5.4.0-65-generic",
        "ansible_lo": {
            "active": true,
            "device": "lo",
            "features": {
                "esp_hw_offload": "off [fixed]",
                "esp_tx_csum_hw_offload": "off [fixed]",
                "fcoe_mtu": "off [fixed]",
                "generic_receive_offload": "on",
                "generic_segmentation_offload": "on",
                "highdma": "on [fixed]",
                "hw_tc_offload": "off [fixed]",
                "l2_fwd_offload": "off [fixed]",
                "large_receive_offload": "off [fixed]",
                "loopback": "on [fixed]",
                "netns_local": "on [fixed]",
                "ntuple_filters": "off [fixed]",
                "receive_hashing": "off [fixed]",
                "rx_all": "off [fixed]",
                "rx_checksumming": "on [fixed]",
                "rx_fcs": "off [fixed]",
                "rx_gro_hw": "off [fixed]",
                "rx_udp_tunnel_port_offload": "off [fixed]",
                "rx_vlan_filter": "off [fixed]",
                "rx_vlan_offload": "off [fixed]",
                "rx_vlan_stag_filter": "off [fixed]",
                "rx_vlan_stag_hw_parse": "off [fixed]",
                "scatter_gather": "on",
                "tcp_segmentation_offload": "on",
                "tls_hw_record": "off [fixed]",
                "tls_hw_rx_offload": "off [fixed]",
                "tls_hw_tx_offload": "off [fixed]",
                "tx_checksum_fcoe_crc": "off [fixed]",
                "tx_checksum_ip_generic": "on [fixed]",
                "tx_checksum_ipv4": "off [fixed]",
                "tx_checksum_ipv6": "off [fixed]",
                "tx_checksum_sctp": "on [fixed]",
                "tx_checksumming": "on",
                "tx_esp_segmentation": "off [fixed]",
                "tx_fcoe_segmentation": "off [fixed]",
                "tx_gre_csum_segmentation": "off [fixed]",
                "tx_gre_segmentation": "off [fixed]",
                "tx_gso_partial": "off [fixed]",
                "tx_gso_robust": "off [fixed]",
                "tx_ipxip4_segmentation": "off [fixed]",
                "tx_ipxip6_segmentation": "off [fixed]",
                "tx_lockless": "on [fixed]",
                "tx_nocache_copy": "off [fixed]",
                "tx_scatter_gather": "on [fixed]",
                "tx_scatter_gather_fraglist": "on [fixed]",
                "tx_sctp_segmentation": "on",
                "tx_tcp6_segmentation": "on",
                "tx_tcp_ecn_segmentation": "on",
                "tx_tcp_mangleid_segmentation": "on",
                "tx_tcp_segmentation": "on",
                "tx_udp_segmentation": "off [fixed]",
                "tx_udp_tnl_csum_segmentation": "off [fixed]",
                "tx_udp_tnl_segmentation": "off [fixed]",
                "tx_vlan_offload": "off [fixed]",
                "tx_vlan_stag_hw_insert": "off [fixed]",
                "vlan_challenged": "on [fixed]"
            },
            "hw_timestamp_filters": [],
            "ipv4": {
                "address": "127.0.0.1",
                "broadcast": "host",
                "netmask": "255.0.0.0",
                "network": "127.0.0.0"
            },
            "ipv6": [
                {
                    "address": "::1",
                    "prefix": "128",
                    "scope": "host"
                }
            ],
            "mtu": 65536,
            "promisc": false,
            "timestamping": [
                "tx_software",
                "rx_software",
                "software"
            ],
            "type": "loopback"
        },
        "ansible_local": {},
        "ansible_lsb": {
            "codename": "focal",
            "description": "Ubuntu 20.04.2 LTS",
            "id": "Ubuntu",
            "major_release": "20",
            "release": "20.04"
        },
        "ansible_lvm": {
            "lvs": {
                "ubuntu-lv": {
                    "size_g": "20.00",
                    "vg": "ubuntu-vg"
                }
            },
            "pvs": {
                "/dev/sda3": {
                    "free_g": "19.00",
                    "size_g": "39.00",
                    "vg": "ubuntu-vg"
                }
            },
            "vgs": {
                "ubuntu-vg": {
                    "free_g": "19.00",
                    "num_lvs": "1",
                    "num_pvs": "1",
                    "size_g": "39.00"
                }
            }
        },
        "ansible_machine": "x86_64",
        "ansible_machine_id": "64d7747e869a45b09d0aae9a6d463611",
        "ansible_memfree_mb": 2765,
        "ansible_memory_mb": {
            "nocache": {
                "free": 3687,
                "used": 248
            },
            "real": {
                "free": 2765,
                "total": 3935,
                "used": 1170
            },
            "swap": {
                "cached": 0,
                "free": 3934,
                "total": 3934,
                "used": 0
            }
        },
        "ansible_memtotal_mb": 3935,
        "ansible_mounts": [
            {
                "block_available": 2357334,
                "block_size": 4096,
                "block_total": 5127828,
                "block_used": 2770494,
                "device": "/dev/mapper/ubuntu--vg-ubuntu--lv",
                "fstype": "ext4",
                "inode_available": 1130751,
                "inode_total": 1310720,
                "inode_used": 179969,
                "mount": "/",
                "options": "rw,relatime",
                "size_available": 9655640064,
                "size_total": 21003583488,
                "uuid": "291656fe-bd87-484c-b4a9-4453471a17e8"
            },
            {
                "block_available": 181527,
                "block_size": 4096,
                "block_total": 249830,
                "block_used": 68303,
                "device": "/dev/sda2",
                "fstype": "ext4",
                "inode_available": 65220,
                "inode_total": 65536,
                "inode_used": 316,
                "mount": "/boot",
                "options": "rw,relatime",
                "size_available": 743534592,
                "size_total": 1023303680,
                "uuid": "45018994-9625-44ad-877a-3980bcf943a3"
            },
            {
                "block_available": 0,
                "block_size": 131072,
                "block_total": 444,
                "block_used": 444,
                "device": "/dev/loop3",
                "fstype": "squashfs",
                "inode_available": 0,
                "inode_total": 10809,
                "inode_used": 10809,
                "mount": "/snap/core18/1944",
                "options": "ro,nodev,relatime",
                "size_available": 0,
                "size_total": 58195968,
                "uuid": "N/A"
            },
            {
                "block_available": 0,
                "block_size": 131072,
                "block_total": 249,
                "block_used": 249,
                "device": "/dev/loop4",
                "fstype": "squashfs",
                "inode_available": 0,
                "inode_total": 472,
                "inode_used": 472,
                "mount": "/snap/snapd/10707",
                "options": "ro,nodev,relatime",
                "size_available": 0,
                "size_total": 32636928,
                "uuid": "N/A"
            },
            {
                "block_available": 0,
                "block_size": 131072,
                "block_total": 559,
                "block_used": 559,
                "device": "/dev/loop5",
                "fstype": "squashfs",
                "inode_available": 0,
                "inode_total": 1578,
                "inode_used": 1578,
                "mount": "/snap/lxd/19032",
                "options": "ro,nodev,relatime",
                "size_available": 0,
                "size_total": 73269248,
                "uuid": "N/A"
            },
            {
                "block_available": 0,
                "block_size": 131072,
                "block_total": 444,
                "block_used": 444,
                "device": "/dev/loop6",
                "fstype": "squashfs",
                "inode_available": 0,
                "inode_total": 10817,
                "inode_used": 10817,
                "mount": "/snap/core18/1988",
                "options": "ro,nodev,relatime",
                "size_available": 0,
                "size_total": 58195968,
                "uuid": "N/A"
            },
            {
                "block_available": 0,
                "block_size": 131072,
                "block_total": 249,
                "block_used": 249,
                "device": "/dev/loop7",
                "fstype": "squashfs",
                "inode_available": 0,
                "inode_total": 470,
                "inode_used": 470,
                "mount": "/snap/snapd/11036",
                "options": "ro,nodev,relatime",
                "size_available": 0,
                "size_total": 32636928,
                "uuid": "N/A"
            },
            {
                "block_available": 0,
                "block_size": 131072,
                "block_total": 560,
                "block_used": 560,
                "device": "/dev/loop0",
                "fstype": "squashfs",
                "inode_available": 0,
                "inode_total": 1578,
                "inode_used": 1578,
                "mount": "/snap/lxd/19188",
                "options": "ro,nodev,relatime",
                "size_available": 0,
                "size_total": 73400320,
                "uuid": "N/A"
            }
        ],
        "ansible_nodename": "ubuntu2004",
        "ansible_processor": [
            "0",
            "GenuineIntel",
            "Intel Xeon Processor (Skylake, IBRS)",
            "1",
            "GenuineIntel",
            "Intel Xeon Processor (Skylake, IBRS)",
            "2",
            "GenuineIntel",
            "Intel Xeon Processor (Skylake, IBRS)",
            "3",
            "GenuineIntel",
            "Intel Xeon Processor (Skylake, IBRS)"
        ],
        "ansible_processor_cores": 1,
        "ansible_processor_count": 4,
        "ansible_processor_threads_per_core": 1,
        "ansible_processor_vcpus": 4,
        "ansible_product_name": "Standard PC (Q35 + ICH9, 2009)",
        "ansible_product_serial": "NA",
        "ansible_product_uuid": "64d7747e-869a-45b0-9d0a-ae9a6d463611",
        "ansible_product_version": "pc-q35-2.11",
        "ansible_python": {
            "executable": "/usr/bin/python3",
            "has_sslcontext": true,
            "type": "cpython",
            "version": {
                "major": 3,
                "micro": 5,
                "minor": 8,
                "releaselevel": "final",
                "serial": 0
            },
            "version_info": [
                3,
                8,
                5,
                "final",
                0
            ]
        },
        "ansible_python_version": "3.8.5",
        "ansible_real_group_id": 0,
        "ansible_real_user_id": 0,
        "ansible_selinux": {
            "status": "Missing selinux Python library"
        },
        "ansible_selinux_python_present": false,
        "ansible_service_mgr": "systemd",
        "ansible_ssh_host_key_dsa_public": "AAAAB3NzaC1kc3MAAACBANcblFlURYN=
VXrHiZ2ozUgS6NQWkL9q6dKRvhFV75WjqBQfZs4wAAd9qYdT/fAJfT+MHdaeKgAzIgCCEH0lwEO=
VJY5go1u3AOEuq6S2b9D1Tr6VufAjuVYuDbPqYCoYPMDepsgKfJIxLGcfs0SgaeJyCzKOh5prQr=
DfYPHIP3NRjAAAAFQDc3uAPrXGgg7q74VaX8yMC5evKjwAAAIEAy+8TP/tI05oSLikv6L5es6J/=
iIXouuCSSlpzYT+ZcA64PaXB7X9ziRUOF79fbWkVYGmCRutjayucFHfsnICwm17vLaA5Pdc18hK=
qgO64HLhX1fBf8BE3KKQFY2nqcop0ShRHsLHWoL5E8SJ0Jrjd+wqw/0SQ4EnxxdmW7mrf+KUAAA=
CAeWRshM/sCGP/DDifYusYkhZ85d5vgeXK/h9d4V3WhnXa6TlNPTo7Y21rX842UJ8npSf+ZVZb9=
iRJMRxGJiGgQK3GPRvdopQPFM9Y+kTf4GfLS5Bmd4RdZXF0POEpe10xc0ewg5is9NsFnJI+mJFc=
EB9FH+TtS0T7PmP+l9ADkTs=3D",
        "ansible_ssh_host_key_ecdsa_public": "AAAAE2VjZHNhLXNoYTItbmlzdHAyN=
TYAAAAIbmlzdHAyNTYAAABBBGumKEwBRlMPpWemu3oyScRXbm4/dH+q5iCKvhB4EsehElxsVTQX=
bNjQyv5Ei38yG34N2q5DvZSus+tD8LJEZW4=3D",
        "ansible_ssh_host_key_ed25519_public": "AAAAC3NzaC1lZDI1NTE5AAAAIBJ=
peIq8MEf3YBN7NLxd/ss/iqbvH9q34eLjYP0tubup",
        "ansible_ssh_host_key_rsa_public": "AAAAB3NzaC1yc2EAAAADAQABAAABgQC=
8hyqeCETLm6kd/kG9lRy9HWIBFFRQTlsIUYdBDmb8dcA0Ye6JwcGhFbEJD5KaWKmyul0OP0dmV4=
BfLdf1dzDvilh0vTfgTTklbsPpEEjlfstqLHpKDZ4wL+Gj8eF54xW00oFwSR68CWNomyR0YrTcz=
sN/CUb5HSejvYS48OzRP+it4iTyrlwVp8Lb7O7m/TnQFbys8uTaFFNpXFm4WrBtK0HlqVI/9LAS=
XnuYqudCOgwkGlKamVnSwCO3Bt8MXFdhkgvXqoEp0sCdGZIM207jrN42hy6stXyjvn/43YbfTAi=
XwJDPUhllpbuUSTRF3zzlIvHbC0JRwq0wGd+eXS5kb9RS6v5QLptn0pA8kxQYg2uqO4I+Uc0R7a=
kmgPu1S85jobS7MJIpZmNj57fGmUC7ZUvYTQ97lXcWrfNzk4pwl9TG85U/tQNwN6X5TmaFuSkqG=
SVRb+a86Z62//BH6lY8sOPEn+Ou883l3QBXjSkgQIjpWKy30GlUcd8Mn6nsgU0=3D",
        "ansible_swapfree_mb": 3934,
        "ansible_swaptotal_mb": 3934,
        "ansible_system": "Linux",
        "ansible_system_capabilities": [],
        "ansible_system_capabilities_enforced": "False",
        "ansible_system_vendor": "QEMU",
        "ansible_uptime_seconds": 12500,
        "ansible_user_dir": "/root",
        "ansible_user_gecos": "root",
        "ansible_user_gid": 0,
        "ansible_user_id": "root",
        "ansible_user_shell": "/bin/bash",
        "ansible_user_uid": 0,
        "ansible_userspace_architecture": "x86_64",
        "ansible_userspace_bits": "64",
        "ansible_virtualization_role": "guest",
        "ansible_virtualization_type": "kvm",
        "gather_subset": [
            "all"
        ],
        "module_setup": true
    },
    "changed": false
}


>
> Thanks,
> - Cleber.


--=20
Alex Benn=C3=A9e

