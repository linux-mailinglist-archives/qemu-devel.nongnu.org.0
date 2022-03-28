Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 561904EA25C
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 23:23:43 +0200 (CEST)
Received: from localhost ([::1]:32830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYwpy-0006X7-Ea
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 17:23:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.davydov@openvz.org>)
 id 1nYwiV-0001x2-Vq
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 17:16:03 -0400
Received: from [2a00:1450:4864:20::22a] (port=36729
 helo=mail-lj1-x22a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.davydov@openvz.org>)
 id 1nYwiS-0003u9-8L
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 17:15:58 -0400
Received: by mail-lj1-x22a.google.com with SMTP id v12so8240207ljd.3
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 14:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TCG2xV4J5L+FOsAT2lTCWPztzU+XMKH5lpvmFE1VfAY=;
 b=ihmWCE/wVZ1FiBkcU3I9XVikDWKgV90juttvyNO1UUBv4oO22gM674rmImRs4uCcpO
 A5Wio6+OZcX3FhM+P6dFC8zZeaau0cA/QNlAbUPwZGheAaeMe8GFU1wkJ9CjskSD/BIK
 EFWs/q4thFAoTggr2heced6LcixZkq+K0Q1tR6q0bXmitIQZ9cVSJrM3F/tjJsHqbNE+
 LBd65IcXzLJCO3WyJKML30pwvtNESBfV8E1Q4U1mYgkqHmVaGUAkdZxCl89dN0T/uhur
 qzUu8ZRzsinwypkN8mzEBVyngTWmjCNgfAUqaL6zEXKKjn0u8xasdqXEId0Dq1X0OehJ
 rU+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TCG2xV4J5L+FOsAT2lTCWPztzU+XMKH5lpvmFE1VfAY=;
 b=TYZixpxqBk3pi3z/Bhl4dyd4L4BF84rYePXW3lKwQzBBdo6cj2J9bmev8OqTo7OJKs
 wQk0MjzCpX+W2Kagh1ig4Pla1F+ET5uzxPwMnyo+Tr84ysQLzm8mnJczvwHThLj5U6pp
 YeBZwex8UNaRCd2dhpsUGPuhFwl9GPg5AxTXs3g09dII/l/J3gPKtbz4cQWyUizs+qYb
 dKxHLtvQf5wRLeG26t6pmEyFdkxUvJyDwPi2pNZfKgs7PS2HDmnxn3fFDOmqCr7uGmnj
 PCGn4nqjAXhGaKAJKMFkv+IZGuQVqueubFfbfjF7uv+Ik5hXVNblpXGZG8qb82UVarux
 CvwA==
X-Gm-Message-State: AOAM532ZvCgHdeMuXzlwp32KmK6dOr2ChtJhBOrPoM7gWV+K/4ETFYcn
 NN0vwO6UaNnC7X5MU11PfkQpgNDLF9pW1g==
X-Google-Smtp-Source: ABdhPJzHr24Uqmnwnq1FmG0ep8ov7eVuoWxjbQnuFCGv/CCQkp/sBWvVPHfi6NHyW+BlwJfGQh5jLg==
X-Received: by 2002:a2e:7c17:0:b0:249:8221:4c2a with SMTP id
 x23-20020a2e7c17000000b0024982214c2amr22401084ljc.293.1648502154361; 
 Mon, 28 Mar 2022 14:15:54 -0700 (PDT)
Received: from localhost.localdomain ([93.175.1.181])
 by smtp.gmail.com with ESMTPSA id
 k15-20020a2e92cf000000b002493cc687f3sm1855827ljh.45.2022.03.28.14.15.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 14:15:53 -0700 (PDT)
From: Maxim Davydov <maxim.davydov@openvz.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 9/9] scripts: printing machine type compat properties
Date: Tue, 29 Mar 2022 00:15:39 +0300
Message-Id: <20220328211539.90170-10-maxim.davydov@openvz.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220328211539.90170-1-maxim.davydov@openvz.org>
References: <20220328211539.90170-1-maxim.davydov@openvz.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::22a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::22a;
 envelope-from=maxim.davydov@openvz.org; helo=mail-lj1-x22a.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: eduardo@habkost.net, v.sementsov-og@mail.ru, berrange@redhat.com,
 xiaoguangrong.eric@gmail.com, mst@redhat.com, jsnow@redhat.com,
 crosa@redhat.com, f4bug@amsat.org, chen.zhang@intel.com, armbru@redhat.com,
 wangyanan55@huawei.com, marcandre.lureau@redhat.com, imammedo@redhat.com,
 lizhijian@fujitsu.com, pbonzini@redhat.com, ani@anisinha.ca, den@openvz.org,
 maxim.davydov@openvz.org, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This script makes the information that can be obtained from
query-init-properties and query-machines easy to read.

Note: some init values from the devices can't be available like properties
from virtio-9p when configure has --disable-virtfs. Such values are
replaced by "DEFAULT". Another exception is properties of abstract
classes. The default value of the abstract class property is common
value of all child classes. But if the values of the child classes are
different the default value will be "BASED_ON_CHILD" (for example, old
x86_64-cpu can have unsupported feature).

Example:

    1) virsh qemu-monitor-command VM --pretty \
       '{"execute" : "query-init-properties"}' > init_props.json

    2) virsh qemu-monitor-command VM --pretty \
       '{"execute" : "query-machines", "arguments" : {"is-full" : true}}' \
       > compat_props.json

    3) scripts/print_MT.py --MT_compat_props compat_props.json\
        --init_props init_props.json --mt pc-q35-7.0 pc-q35-6.1

Output:
╒═══════════════════════════════════╤══════════════╤══════════════╕
│           property_name           │  pc-q35-7.0  │  pc-q35-6.1  │
╞═══════════════════════════════════╪══════════════╪══════════════╡
│   ICH9-LPC-x-keep-pci-slot-hpc    │     True     │    False     │
├───────────────────────────────────┼──────────────┼──────────────┤
│          nvme-ns-shared           │     True     │     off      │
├───────────────────────────────────┼──────────────┼──────────────┤
│ vhost-user-vsock-device-seqpacket │     auto     │     off      │
├───────────────────────────────────┼──────────────┼──────────────┤
│ virtio-mem-unplugged-inaccessible │     auto     │     off      │
├───────────────────────────────────┼──────────────┼──────────────┤
│  x86_64-cpu-hv-version-id-build   │    14393     │    0x1bbc    │
├───────────────────────────────────┼──────────────┼──────────────┤
│  x86_64-cpu-hv-version-id-major   │      10      │    0x0006    │
├───────────────────────────────────┼──────────────┼──────────────┤
│  x86_64-cpu-hv-version-id-minor   │      0       │    0x0001    │
╘═══════════════════════════════════╧══════════════╧══════════════╛

Signed-off-by: Maxim Davydov <maxim.davydov@openvz.org>
---
 scripts/print_MT.py | 274 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 274 insertions(+)
 create mode 100755 scripts/print_MT.py

diff --git a/scripts/print_MT.py b/scripts/print_MT.py
new file mode 100755
index 0000000000..8be13be8d7
--- /dev/null
+++ b/scripts/print_MT.py
@@ -0,0 +1,274 @@
+#! /usr/bin/python3
+#
+# Script for printing machine type compatible features. It uses two JSON files
+# that should be generated by qmp-init-properties and query-machines.
+#
+# Copyright (c) 2022 Maxim Davydov <maxim.davydov@openvz.org>
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program. If not, see <http://www.gnu.org/licenses/>.
+#
+
+import pandas as pd
+import json
+from tabulate import tabulate
+from argparse import ArgumentParser
+
+
+# used for aliases and other names that can be changed
+aliases = { "e1000-82540em": "e1000" }
+
+
+def get_major(mt):
+    splited = mt.split('.')
+    if (len(splited) >= 2):
+        return int(mt.split('.')[1])
+    else:
+        return 0
+
+
+def get_prefix(mt):
+    splited = mt.split('.')
+    if (len(splited) >= 1):
+        return mt.split('.')[0]
+    else:
+        return mt
+
+
+def get_mt_sequence(mt_data):
+    mt_list = [mt['name'] for mt in mt_data['return']]
+    mt_list.remove('none')
+
+    mt_list.sort(key=get_major, reverse=True)
+    mt_list.sort(key=get_prefix, reverse=True)
+
+    return mt_list
+
+
+def get_req_props(defval_data, prop_set, abstr_class_to_features):
+    req_prop_values = dict()
+    req_abstr_prop_values = dict()
+
+    for device in defval_data['return']:
+        # Skip cpu devices that will break all default values for cpus
+        if device['name'] == 'base-x86_64-cpu':
+            continue
+        if device['name'] == 'max-x86_64-cpu':
+            continue
+
+        # some features in mt set as one absract class
+        # but this features are owned by another class
+        device_props_owners = dict()
+        for props_class in device['props']:
+            if not 'classprops' in props_class: # for example, Object class
+                continue
+
+            for prop in props_class['classprops']:
+                if not 'value' in prop:
+                    continue
+
+                prop_name = device['name'] + '-' + prop['name']
+                device_props_owners[prop['name']] = prop['value']
+                if prop_name in prop_set:
+                    req_prop_values[prop_name] = prop['value']
+
+        for props_class in device['props']:
+            if not props_class['classname'] in abstr_class_to_features:
+                continue
+
+            for req_prop in abstr_class_to_features[props_class['classname']]:
+                if not req_prop in device_props_owners:
+                    continue
+
+                prop_value = device_props_owners[req_prop]
+                prop_name = props_class['classname'] + '-' + req_prop
+                if req_abstr_prop_values.setdefault(prop_name, prop_value) \
+                    != prop_value:
+                    req_abstr_prop_values[prop_name] = 'BASED_ON_CHILD'
+
+    return req_prop_values, req_abstr_prop_values
+
+
+def make_definition_table(mt_to_compat_props, prop_set,
+                          req_props, req_abstr_props, is_full):
+    mt_table = dict()
+    for prop in sorted(prop_set):
+        if not is_full:
+            values = set()
+            for mt in mt_to_compat_props:
+                if prop in mt_to_compat_props[mt]:
+                    values.add(mt_to_compat_props[mt][prop])
+                else:
+                    if prop in req_props:
+                        values.add(req_props[prop])
+                    else:
+                        values.add('DEFAULT')
+            # Skip the property if its value is the same for
+            # all required machines
+            if len(values) == 1:
+                continue
+
+        mt_table.setdefault('property_name', []).append(prop)
+        for mt in mt_to_compat_props:
+            if prop in mt_to_compat_props[mt]:
+                value = mt_to_compat_props[mt][prop]
+                mt_table.setdefault(mt, []).append(value)
+            else:
+                if prop in req_props:
+                    mt_table.setdefault(mt, []).append(req_props[prop])
+                else:
+                    value = req_abstr_props.get(prop, 'DEFAULT')
+                    mt_table.setdefault(mt, []).append(value)
+
+    return mt_table
+
+
+def get_standard_form(value):
+    if type(value) is str:
+        out = value.upper()
+        if out.isnumeric():
+            return int(out)
+        if out == 'TRUE':
+            return True
+        if out == 'FALSE':
+            return False
+
+    return value
+
+
+def get_features(mt_data, defval_data, mts, is_full):
+    prop_set = set()
+    abstr_prop_set = set()
+    mt_to_compat_props = dict()
+    # It will be used for searching appropriate feature (sometimes class name
+    # in machine type definition and real class name are different)
+    abstr_class_to_features = dict()
+
+    for mt in mt_data['return']:
+        if mt['name'] == 'none':
+            continue
+
+        if not mt['name'] in mts:
+            continue
+
+        mt_to_compat_props[mt['name']] = dict()
+        for prop in mt['compat-props']:
+            driver_name = aliases.get(prop['driver'], prop['driver'])
+            prop_name = prop['driver'] + '-' + prop['property']
+            real_name = driver_name + '-' + prop['property']
+            # value is always string
+            prop_val  = get_standard_form(prop['value'])
+            if prop['abstract']:
+                mt_to_compat_props[mt['name']][real_name] = prop_val
+                abstr_prop_set.add(real_name)
+                abstr_class_to_features.setdefault(driver_name,
+                                                   set()).add(prop['property'])
+            else:
+                mt_to_compat_props[mt['name']][real_name] = prop_val
+                prop_set.add(real_name)
+
+    req_props, req_abstr_props = get_req_props(defval_data, prop_set,
+                                               abstr_class_to_features)
+
+    # join sets for global sorting by name
+    prop_set.update(abstr_prop_set)
+    mt_table = make_definition_table(mt_to_compat_props, prop_set, req_props,
+                                     req_abstr_props, is_full)
+    # to save mt sequence
+    df = pd.DataFrame({'property_name': mt_table['property_name']})
+    for mt in mts:
+        if not mt in mt_table:
+            print('Error: {0} no found'.format(mt))
+            continue
+        df[mt] = mt_table[mt]
+
+    return df
+
+
+def main():
+    parser = ArgumentParser(description='''Print definition of machine
+                                           type (compatible features)''')
+    parser.add_argument('--MT_compat_props', type=str, required=True,
+                        help='''Path to JSON file with current machine type
+                                definition. It must be generated via
+                                query-machines with is-full option.''')
+    parser.add_argument('--init_props', type=str, required=True,
+                        help='''Path to JSON file with initial features. It
+                                must be generated via
+                                query-init-properties.''')
+    parser.add_argument('--format', type=str,
+                        choices=['table', 'csv', 'html', 'json'],
+                        default='table', help='Format of the output file')
+    parser.add_argument('--file', type=str,
+                        help='''Path to output file. It must be set with csv
+                                and html formats.''')
+    parser.add_argument('--all', action='store_true',
+                        help='''Print all available machine types (list of
+                                machine types will be ignored''')
+    parser.add_argument('--mt', nargs="*", type=str,
+                        help='List of machine types that will be compared')
+    parser.add_argument('--full', action='store_true',
+                        help='''Print all defined properties (by default,
+                                only properties with different values are
+                                printed)''')
+
+    args = parser.parse_args()
+
+    if args.all == 0 and args.mt == None:
+        print('Enter the list of required machine types (list of all '\
+              'machine types : qemu-system-x86_64 --machine help)')
+        return
+
+    with open(args.MT_compat_props) as mt_json_file:
+        mt_data = json.load(mt_json_file)
+
+    with open(args.init_props) as defval_json_file:
+        defval_data = json.load(defval_json_file)
+
+    if args.all:
+        df = get_features(mt_data, defval_data, get_mt_sequence(mt_data),
+                          args.full)
+    else:
+        df = get_features(mt_data, defval_data, args.mt, args.full)
+
+    if args.format == 'csv':
+        if args.file == None:
+            print('Error: csv format requires path to output file')
+            return
+        df.to_csv(args.file)
+    elif args.format == 'html':
+        if args.file == None:
+            print('Error: html format requires path to output file')
+            return
+        with open(args.file, 'w') as output_html:
+            output_html.write(df.to_html(justify='center', col_space='400px',
+                                         index=False))
+    elif args.format == 'json':
+        json_table = df.to_json()
+        if args.file == None:
+            print(json_table)
+        else:
+            with open(args.file, 'w') as output_json:
+                output_json.write(json_table)
+    elif args.format == 'table':
+        table = tabulate(df, showindex=False, stralign='center',
+                         tablefmt='fancy_grid', headers='keys')
+        if args.file == None:
+            print(table)
+        else:
+            with open(args.file, 'w') as output_table:
+                output_table.write(table)
+
+
+if __name__ == '__main__':
+    main()
-- 
2.31.1


